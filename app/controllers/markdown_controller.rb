require 'markdown_redcarpet'

class MarkdownController < ActionController::Base
  unloadable
  
  def raw
    render :text => ::Redmine::MarkdownRedcarpet.to_html(request.body.read)
  rescue => e
    response.headers['Content-Type'] = "text/plain"
    render :text => "problem parsing markdown text: #{e.message}", :status => 500
  end
end
