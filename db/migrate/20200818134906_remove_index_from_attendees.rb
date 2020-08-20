class RemoveIndexFromAttendees < ActiveRecord::Migration[6.0]
  def change
    remove_index :attendees, name: "index_attendees_on_event_id"
    remove_index :attendees, name: "index_attendees_on_user_id"
  end
end
