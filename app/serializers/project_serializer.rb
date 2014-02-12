class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :repository, :repository_url, :description, :github_details
end
