module Knob
  module ViewHelpers
    module ActionView
      def knob(options = {})
        value = options.delete(:class)
        classes = ["knob"]
        data_opts = []
        data_options = options.delete(:data)
        data_options.each do |key, val|
          data_opts << { "data-#{key}" => val }
        end
        classes.concat Array(options.delete(:class))
        content_tag(:input, value, options.merge(class: classes).merge(data_opts))
      end
    end
  end
end
