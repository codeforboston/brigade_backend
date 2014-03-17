require 'spec_helper'

describe Event do
  let(:event) { Event.create(name: 'weekly event', start_time: Time.utc(2014, 1, 3, 0).in_time_zone) }
  it "returns an event's meetup details" do
    meetup_event = double(name: 'weekly event', time: DateTime.new(2014,1,2,19,0,0,'-5'))
    Connectors::Meetup.stub(:events) { [double(name: 'weekly event', time: DateTime.new(2014,1,9,19,0,0,'-5')), meetup_event, double(name: 'some other event', time: DateTime.new(2014,1,2,19,0,0,'-5'))] }
    expect(event.meetup_details).to equal meetup_event
  end

  it { should belong_to(:brigade) }
end
