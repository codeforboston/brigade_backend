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
