class User < ApplicationRecord
  has_many :created_events, foreign_key: "creator_id", class_name: 'Event'
  has_many :invitations, foreign_key: :attendee_id
  has_many :attending_events, through: :invitations
  def upcoming_events
    @upcoming_events = self.attending_events.where("event_date >= ?", Time.current)
  end
  def past_events
    @past_events = self.attending_events.where("event_date < ?", Time.current)
  end
end
