require 'redmine'

Rails.configuration.to_prepare do
  require_dependency 'repositories_controller_hook'
  require_dependency 'markdown_redcarpet'
end

Redmine::Plugin.register :redmine_redcarpet_viewer do
  name 'Redmine Redcarpet Viewer plugin'
  author 'Toshiyuki Goto'
  description 'Preview markdown in repository.'
  version '0.0.2'
  url 'https://github.com/ngyuki/redmine_redcarpet_viewer'
  author_url 'https://github.com/ngyuki'
end
