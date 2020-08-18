class AddInvitations < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :attendee_id, :integer
    add_column :invitations, :attending_event_id, :integer
  end
end
