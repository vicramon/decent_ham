require 'rails/generators'

module DecentHam
  class DecentHamGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def singular_name
      name.singularize
    end

    def plural_name
      name
    end

    def strong_params
      strong_params = ":#{singular_name}_params"
    end

    def create_model
      template "model.rb", "app/models/#{singular_name}.rb"
    end

    def model_attributes
      constant_name.columns_hash.map do |key, value|
        OpenStruct.new(name: key, data_type: value.type)
      end.delete_if { |column| %w(id created_at updated_at).include? column.name }
    end

    def create_controller
      @attributes = model_attributes
      template "controller.rb", "app/controllers/#{name}_controller.rb"
    end

    def add_route
      route "resources :#{name}"
    end

    def constant_name
      singular_name.capitalize.constantize
    end

    def attach_form_fields
      model_attributes.each do |attribute|
        attribute.form_field =
        case attribute.data_type
        when :string || :decimal || :integer || :float || :references
          "f.text_field :#{attribute.name}"
        when :text
          "f.text_area :#{attribute.name}"
        when :datetime || :timestamp
          "f.datetime_select :#{attribute.name}"
        when :boolean
          "f.check_box :#{attribute.name}"
        when :date
          "f.date_select :#{attribute.name}"
        when :time
          "f.time_select :#{attribute.name}"
        end
      end
    end

    def create_views
      @attributes = attach_form_fields
      %w(index new edit _form show).each do |view_name|
        template "#{view_name}.html.haml", "app/views/#{name}/#{view_name}.html.haml"
      end
    end

  end
end
