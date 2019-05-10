module DefaultForm::ControllerHelper

  def self.prepended(model)

    def model.default_form_builder(builder, &block)
      builder = define_form_builder(builder, &block)
      super builder
    end

    def model.define_form_builder(builder, &block)
      if builder.is_a? String
        Object.const_set builder, Class.new(DefaultForm::DefaultBuilder)
        builder_class = builder.constantize
        builder_class.config.on = ActiveSupport::OrderedOptions.new
        builder_class.config.css = ActiveSupport::OrderedOptions.new

        if block_given?
          yield builder_class.config
        end

        builder_class
      end
    end

  end

end

ActiveSupport.on_load :action_controller do
  prepend DefaultForm::ControllerHelper
end


