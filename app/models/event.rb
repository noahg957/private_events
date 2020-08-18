class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :invitations, foreign_key: :attending_event_id
  has_many :attendees, through: :invitations

  scope :upcoming, -> { where("event_date >= ?", Time.current)}
  scope :past, -> { where("event_date < ?", Time.current)}
end
