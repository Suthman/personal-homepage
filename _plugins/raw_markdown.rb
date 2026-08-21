module Jekyll
  class RawMarkdownGenerator < Generator
    safe true
    priority :high

    # Configure how many levels you want to shift the markdown headers down.
    # If your content section is #### Content (H4), a shift of 4 turns a # (H1) into a ##### (H5).
    HEADER_SHIFT_LEVEL = 4

    def generate(site)
      # Pre-generate the global site payload containing baseurl, url, site variables etc.
      @site_payload = site.site_payload

      # 1. Process all blog posts
      site.posts.docs.each do |post|
        process_document(post, site)
      end

      # 2. Process all selected pages
      site.pages.each do |page|
        process_document(page, site)
      end
    end

    private

    def process_document(doc, site)
      full_path = site.in_source_dir(doc.relative_path)
      return unless File.exist?(full_path)

      file_content = File.read(full_path, encoding: "utf-8")
      content_parts = file_content.split(/^---+\s*$/)

      if content_parts.size >= 3
        # Extract the raw markdown body (everything after the front matter)
        raw_markdown = content_parts[2..].join("---").strip

        begin
          # We pass the site payload as environments and register the true system structures.
          context = Liquid::Context.new(
            [@site_payload.merge({ "page" => doc.data })], # Environments
            {},                                            # Outer Scopes
            { site: site, page: doc.data },                # Registers (CRUCIAL!)
            true                                           # Rethrow Errors
          )
          
          template = site.liquid_renderer.file(doc.path).parse(raw_markdown)

          # Render the liquid tags with full access to configuration drops and includes
          rendered_markdown = template.render(context)
        rescue => e
          Jekyll.logger.warn "RawMarkdownGenerator:", "Could not render Liquid tags in #{doc.relative_path}: #{e.message}"
          rendered_markdown = raw_markdown
        end

        # 1. Convert HTML img to Markdown link
        rendered_markdown.gsub!(/<img\b[^>]*?>/im) do |img_tag|
          src_match = img_tag.match(/\bsrc=["']([^"']+)["']/i)
          # extract ONLY the URL inside the quotes, not the whole 'src="..."' string
          src_url = src_match ? src_match[1] : ""

          alt_match = img_tag.match(/\balt=["']([^"']+)["']/i)
          alt_text = alt_match ? alt_match[1] : ""
          
          if src_url.empty?
            ""
          else
            "![#{alt_text}](#{src_url})"
          end
        end

        # 2. Removes HTML tags except <style> and </style> tags
        rendered_markdown.gsub!(/<(?!style\b|\/style\b)\/?[^>]*>/i, "")

        # 3. Hierarchy shift: Dynamically shift all markdown headers down based on the constant
        rendered_markdown.gsub!(/^(#+)(?=\s)/) do |header_match|
          header_match + ("#" * HEADER_SHIFT_LEVEL)
        end

        # 4. Strip all accidental leading spaces before images globally
        # This targets any line that has leading spaces followed immediately by an image link.
        rendered_markdown.gsub!(/^[ \t]+(\!\[)/, '\1')

        # Clean up lines that contain nothing but empty whitespace
        rendered_markdown.gsub!(/^[ \t]+$/, '')

        doc.data["raw_md"] = rendered_markdown.strip
      else
        doc.data["raw_md"] = doc.content
      end
    end
  end
end
