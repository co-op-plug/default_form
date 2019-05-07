module DefaultForm::Builder::Default
  VALIDATIONS = [
    :required,
    :pattern,
    :min, :max, :step,
    :maxlength
  ]

  def default_value(method)
    begin
      return object.send(method) if origin_on.autocomplete
    rescue
      if origin_on.autocomplete
        if object_name
          return params[object_name]&.fetch(method, '')
        else
          return params[method]
        end
      end
    end
  end

  def default_step(method)
    if object.is_a?(ActiveRecord::Base)
      0.1.to_d.power(object.class.columns_hash[method.to_s]&.scale.to_i)
    else
    end
  end

  def default_placeholder(method)
    if object.is_a?(ActiveRecord::Base)
      object.class.human_attribute_name(method)
    else
      # todo
    end
  end

  def default_help(method)
    if object.is_a?(ActiveRecord::Base)
      object.class.help_i18n(method)
    else
      nil
    end
  end

  def default_options(method, options)
    options[:class] ||= origin_css[:input]

    # todo better condition
    if self.is_a?(DefaultForm::SearchBuilder)
      options[:value] ||= default_value(method)
    end
    if origin_on[:placeholder]
      options[:placeholder] ||= default_placeholder(method)
    end
    default_valid(options)
  end

  def default_valid(options)
    valid_key = options.keys & VALIDATIONS
    if valid_key.present?
      options[:data] ||= {}
      options[:data][:valid] = true unless options[:data].key?(:valid)
    end
    options
  end

  def extra_config(options)
    custom_config = options.extract!(:on, :css)
    custom_config[:css] ||= {}
    custom_config[:on] ||= {}
    custom_config[:required] = options[:required]
    custom_config
  end

end
