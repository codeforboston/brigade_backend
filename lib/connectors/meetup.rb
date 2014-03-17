module Connectors
  class Meetup
    class << self
      RMeetup::Client.api_key = Setup.meetup_api_key
      def events
        RMeetup::Client.fetch :events, group_urlname: Setup.brigade_meetup
      end

      def fetch_events(type, args)
        RMeetup::Client.fetch(type, args)
      end
    end
  end
end
