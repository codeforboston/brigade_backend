module BrigadeBackend
  class Project < ActiveRecord::Base
    def github_details
      BrigadeBackend::Connectors::Github.repositories.detect { |r| r.name == repository }
    end
  end
end
