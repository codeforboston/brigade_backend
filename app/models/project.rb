class Project < ActiveRecord::Base
  attr_accessible :name, :url, :repository, :description
  def repository_url
    "https://github.com/#{Setup.brigade_github}/#{repository}"
  end

  def github_details
    Connectors::Github.repositories.detect { |r| r.name == repository }
  end
end
