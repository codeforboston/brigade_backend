require 'octokit'
require 'faraday-http-cache'

Octokit.middleware = Faraday::Builder.new do |builder|
  # builder.response :logger
  builder.use Faraday::HttpCache
  builder.use Octokit::Response::RaiseError
  builder.adapter Faraday.default_adapter
end

module BrigadeBackend
  module Connectors
    class Github
      class << self
        # FIXME obviously needs to be configurable
        @@client = Octokit.org 'codeforboston'

        def client
          @@client
        end

        def repositories
          @@client.rels[:repos].get(type: 'public').data
        end
      end
    end
  end
end
