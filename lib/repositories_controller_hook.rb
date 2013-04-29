require 'redmine'

module RepositoriesControllerHook

  def self.included(base)
    RepositoriesController.class_eval do

      alias redmine_redcarpet_viewer_orig_entry entry
      def entry
        redmine_redcarpet_viewer_orig_entry
        if not performed? and @path =~ /\.(md|markdown)\z/
          @content = ::Redmine::MarkdownRedcarpet.to_html(@content)
          @content.force_encoding('UTF-8') if @content.respond_to?(:force_encoding)
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
  end
end

RepositoriesController.send(:include, RepositoriesControllerHook) unless RepositoriesController.included_modules.include? RepositoriesControllerHook
