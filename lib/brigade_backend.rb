require "brigade_backend/engine"

module BrigadeBackend
  module Connectors
    autoload :Github, 'brigade_backend/connectors/github'
  end
end
