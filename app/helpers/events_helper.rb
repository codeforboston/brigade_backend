module EventsHelper

  def display_event_criteria(criteria, hash_key)
    format_criteria_display(criteria, hash_key) if criteria != nil
  end

  def import_status(event_id)
    "<strong>IMPORTED</strong>".html_safe if imported?(event_id)
  end

  def allow_import?(event_id)
    check_box_tag("events[]", event_id) if !imported?(event_id) 
  end
  

  private

  def format_criteria_display(criteria, hash_key)
    additional_criteria_exists?(hash_key) ? criteria[hash_key] : criteria
  end

  def additional_criteria_exists?(hash_key)
    true if hash_key != nil
  end

  def imported?(event_id)
    true if Event.find_by_meetup_id(event_id)
  end

end
