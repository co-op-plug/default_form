# frozen_string_literal: true

module DefaultForm::Builder::Default
  VALIDATIONS = [
    :required,
    :pattern,
    :min, :max, :step,
    :maxlength
  ].freeze
  
  def default_label(method, settings: {})
    return ''.html_safe unless settings.dig(:on, :label)
    
    label(method, settings.delete(:label))
  end

  def default_help(method)
    if object.is_a?(ActiveRecord::Base)
      object.class.help_i18n(method)
    end
  end
  
  def default_value(method, settings: {})
    return unless settings.dig(:on, :autocomplete)
    
    if object.is_a?(ActiveRecord::Base)
      r = object.respond_to?(method) && object.send(method)
      return r if r
    end
    
    if object_name.present?
      params.dig(object_name, method)
    else
      params[method]
    end
  end

  def default_step(method)
    if object.is_a?(ActiveRecord::Base)
      0.1.to_d.power(object.class.columns_hash[method.to_s]&.scale.to_i)
    end
  end

  def default_placeholder(method)
    if object.is_a?(ActiveRecord::Base)
      object.class.human_attribute_name(method)
    end
  end

  def default_options(method, options = {}, settings: {})
    options[:class] = settings.dig(:css, :input) unless options.key?(:class)

    if self.is_a?(DefaultForm::SearchBuilder)
      options[:value] = default_value(method, settings: settings) unless options.key?(:value)
    end
    
    if settings.dig(:on, :placeholder)
      options[:placeholder] = default_placeholder(method) unless options.key?(:placeholder)
    end
    
    valid_key = options.keys.map(&:to_sym) & VALIDATIONS
    if valid_key.present?
      options[:data] ||= {}
      options[:data][:valid] = true unless options[:data].key?(:valid)
    end
    
    options
  end

  def extract_settings(options = {})
    settings = options.extract!(:on, :css, :label, :required)
    settings[:on] ||= {}
    settings[:on].with_defaults!(origin_on)
    settings[:css] ||= {}
    settings[:css].with_defaults!(origin_css)
    settings
  end

end
