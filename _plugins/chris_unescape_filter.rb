require 'cgi'

module Jekyll
  module UnescapeFilter
    def unescape_html(input)
      return if input.nil?
      CGI.unescapeHTML(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::UnescapeFilter)
