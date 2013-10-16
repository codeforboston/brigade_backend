module BrigadeBackend
  class ProjectSerializer < ActiveModel::Serializer
    attributes *Project.attribute_names.map(&:to_sym)
  end
end
