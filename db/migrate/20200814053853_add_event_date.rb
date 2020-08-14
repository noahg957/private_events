class AddEventDate < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_date, :date
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
