class Project < ActiveRecord::Base
  attr_accessible :name, :url, :repository, :description
  def github_details
    Connectors::Github.repositories.detect { |r| r.name == repository }
  end
end
