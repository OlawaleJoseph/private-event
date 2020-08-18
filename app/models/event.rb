class Event < ApplicationRecord
  belongs_to :creator,class_name:"User"

  has_many :attendees
  has_many :users, through: :attendees

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :event_date, presence: true
end
