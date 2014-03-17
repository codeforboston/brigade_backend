class Brigade < ActiveRecord::Base
  attr_accessible :meetup_id, :name
  has_many :events

  def self.meetup_ids
    meetup_ids = ""
    self.all.each do |brigade|
      brigade == Brigade.last ? meetup_ids <<"#{brigade.meetup_id}" : meetup_ids << "#{brigade.meetup_id}, "
    end
    meetup_ids
  end

end
