module Knob
  module Rails
    class Engine < ::Rails::Engine
    end
  end

  class Railtie < ::Rails::Railtie
    initializer "knob.action_view" do |app|
      ActiveSupport.on_load :action_view do
        require 'knob/view_helpers/action_view'
        include Knob::ViewHelpers::ActionView
      end
    end
  end
end
