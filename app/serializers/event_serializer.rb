class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_time, :url, :description, :meetup_details
end
