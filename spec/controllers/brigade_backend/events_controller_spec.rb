require 'spec_helper'

module BrigadeBackend
  describe EventsController do
    routes { Engine.routes }
    it "returns an event in JSON format after it's created" do
      post :create, event: {name: 'Meetup Event'}, format: :json
      event = assigns[:event]
      event.should be_an_instance_of(Event)
      event.name.should == 'Meetup Event'
      response.body.should == EventSerializer.new(event).to_json
    end
  end
end
