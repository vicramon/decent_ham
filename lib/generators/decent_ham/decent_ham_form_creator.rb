module DecentHam
  module DecentHamFormCreator

    def form_field_map
      {
        string: "text_field", 
        decimal: "text_field",
        integer: "text_field",
        float: "text_field",
        references: "text_field",
        text: "text_area",
        datetime: "datetime_select",
        timestamp: "datetime_select",
        boolean: "check_box",
        date: "date_select",
        time: "time_select",
      }
    end

    def decent_form_field_for(name, data_type)
      "f." + form_field_map[data_type] + " :" + name
    end

    def model_attributes
      constant_name.columns_hash.map do |key, value|
        OpenStruct.new(name: key, data_type: value.type, form_field: decent_form_field_for(key, value.type))
      end.delete_if { |column| %w(id created_at updated_at).include? column.name }
    end

  end
end
