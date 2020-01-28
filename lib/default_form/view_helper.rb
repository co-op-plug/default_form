# frozen_string_literal: true

require 'default_form/form_builder'
module DefaultForm::ViewHelper

  def form_object(record = nil, builder: DefaultForm::FormBuilder, **options)
    object_name = options[:as].to_s

    if object_name.blank? && record.is_a?(ActiveRecord::Base)
      object_name = record.class.base_class.model_name.param_key
    end

    builder.new(object_name, record, self, options)
  end

  # theme: :default
  def form_with(**options, &block)
    options[:theme] = 'default' unless options.key?(:theme)
    unless options.key?(:scope)
      options[:scope] = '' if options[:theme].end_with? 'search'
    end
    if options[:theme].end_with? 'search'
      options[:url] = url_for unless options.key?(:url)
    end

    super
  end

  def form_for(record, options = {}, &block)
    options[:theme] = 'default' unless options.key?(:theme)

    super
  end

end

ActiveSupport.on_load :action_view do
 include DefaultForm::ViewHelper
end
