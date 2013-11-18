module Connectors
  class Github
    class << self
      @@client = Octokit.org Setup.brigade_github

      def client
        @@client
      end

      def repositories
        @@client.rels[:repos].get(type: 'public').data
      end
    end
  end
end
