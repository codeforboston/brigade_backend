
require 'active_model_serializers'

module BrigadeBackend
  class Engine < ::Rails::Engine
    isolate_namespace BrigadeBackend
    config.generators do |g|
      g.test_framework :rspec, view_specs: false
      g.javascripts false
      g.stylesheets false
    end
  end
end
