require 'rails/generators'
require_relative 'decent_ham_form_creator'
require_relative 'decent_ham_decorator'

module DecentHam

  class DecentHamGenerator < Rails::Generators::NamedBase
    include DecentHamFormCreator
    include DecentHamDecorator

    source_root File.expand_path('../templates', __FILE__)

    def create_model
      template "model.rb", "app/models/#{singular_name}.rb"
    end

    def constant_name
      singular_name.capitalize.constantize
    end

    def create_controller
      @attributes = model_attributes
      template "controller.rb", "app/controllers/#{name}_controller.rb"
    end

    def add_route
      route "resources :#{name}"
    end

    def create_views
      @attributes = model_attributes
      %w(index new edit _form show).each do |view_name|
        template "#{view_name}.html.haml", "app/views/#{name}/#{view_name}.html.haml"
      end
    end

  end
end
