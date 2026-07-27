module Jekyll
  class RawMarkdownGenerator < Generator
    safe true
    priority :high

    # Configure how many levels you want to shift the markdown headers down.
    # If your content section is #### Content (H4), a shift of 4 turns a # (H1) into a ##### (H5).
    HEADER_SHIFT_LEVEL = 4

    def generate(site)
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

      file_content = File.read(full_path, encoding: 'utf-8')
      content_parts = file_content.split(/^---+\s*$/)
      
      if content_parts.size >= 3
        # Extract the raw markdown body (everything after the front matter)
        raw_markdown = content_parts[2..].join("---").strip
        
        # Cleanup HTML style blocks before rendering
        raw_markdown.gsub!(/<style>.*?<\/style>/m, '')

        begin
          # Create a proper Liquid context using Jekyll's internal template environment
          # This provides the necessary registers (like :site, :page) so {% include %} tags don't crash
          context = Liquid::Context.new({}, {}, { :site => site, :page => doc.data })
          template = site.liquid_renderer.file(doc.path).parse(raw_markdown)
          
          # Render the liquid tags (includes will be resolved into their raw text/markdown/html output)
          rendered_markdown = template.render(context)
        rescue => e
          Jekyll.logger.warn "RawMarkdownGenerator:", "Could not render Liquid tags in #{doc.relative_path}: #{e.message}"
          rendered_markdown = raw_markdown
        end

        # Post-rendering cleanup: Remove raw HTML tags that includes might have introduced (e.g., <p>, <br>),
        # but keep normal text and markdown symbols like ## or - completely intact.
        rendered_markdown.gsub!(/<\/?[^>]*>/, '')

        # Hierarchy shift: Dynamically shift all markdown headers down based on the constant
        rendered_markdown.gsub!(/^(#+)(?=\s)/) do |header_match| 
          header_match + ("#" * HEADER_SHIFT_LEVEL)
        end
        
        doc.data['raw_md'] = rendered_markdown.strip
      else
        doc.data['raw_md'] = doc.content
      end
    end
  end
end
