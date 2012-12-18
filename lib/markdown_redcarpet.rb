require 'redmine'
require 'cgi'
require 'redcarpet'

module Redmine
  module MarkdownRedcarpet

    class HTMLwithSyntaxHighlighting < ::Redcarpet::Render::HTML

      def block_code(code, language)
        if language != nil 
          "<pre><code class='#{language} syntaxhl'>" \
          + Redmine::SyntaxHighlighting.highlight_by_language(code, language) \
          + "</code></pre>"
        else
          "<pre>" + CGI.escapeHTML(code) + "</pre>"
        end
      end

      def block_quote(quote)
        "<blockquote>\n" << quote.gsub(/\n([^<])/,'<br>\1') << "</blockquote>\n"
      end
    end

    def to_html(text)
      markdown = ::Redcarpet::Markdown.new(
        HTMLwithSyntaxHighlighting,
        :autolink => true,
        :space_after_headers => true,
        :fenced_code_blocks => true,
        :tables => true,
        :strikethrough => true,
        :superscript => true
      )
      markdown.render(text)
    end

    module_function :to_html
  end
end
