module DecentHam
  module DecentHamDecorator

    def singular_name
      name.singularize
    end

    def plural_name
      name
    end

    def strong_params
      strong_params = ":#{singular_name}_params"
    end

    def constant_name
      singular_name.capitalize.constantize
    end

  end
end
