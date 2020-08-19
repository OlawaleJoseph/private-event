class Event < ApplicationRecord
  belongs_to :creator,class_name:"User"

  has_many :attendees
  has_many :invitations, through: :attendees, source: :user

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :event_date, presence: true

  scope :upcoming, -> { where("event_date > ?", Time.new) }
  scope :past, ->  { where("event_date < ?", Time.new) }

end
