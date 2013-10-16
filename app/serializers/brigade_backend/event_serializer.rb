module BrigadeBackend
  class EventSerializer < ActiveModel::Serializer
    attributes :id#*Event.attribute_names.map(&:to_sym)
  end
end
