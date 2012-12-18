require 'redmine'
require 'markdown_redcarpet'

RepositoriesController.class_eval do
  alias redmine_redcarpet_viewer_orig_entry entry
  def entry
    redmine_redcarpet_viewer_orig_entry
    if not performed? and @path =~ /\.(md|markdown)\z/
      @content = ::Redmine::MarkdownRedcarpet.to_html(@content)
      render :action => "entry_markdown"
    end
  rescue => e
    @error = e.message
    render :action => "entry_markdown_error"
  end

  alias redmine_redcarpet_viewer_orig_is_entry_text_data? is_entry_text_data?
  def is_entry_text_data?(ent, path)
    return true if path =~ /\.(md|markdown)\z/
    redmine_redcarpet_viewer_orig_is_entry_text_data?(ent, path)
  end
end

Redmine::Plugin.register :redmine_redcarpet_viewer do
  name 'Redmine Redcarpet Markdown Viewer plugin'
  author 'tsyk goto'
  description 'Redmine show Redcarpet Markdown in repository'
  version '0.0.1'
  url 'http://github.com/ngyuki/redmine_redcarpet_viewer'
  author_url 'http://github.com/ngyuki'
end
