# frozen_string_literal: true

class User < ApplicationRecord
  has_many :attendees
  has_many :occasions, through: :attendees ,source: :event

  has_many :events, foreign_key: "creator_id"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def to_s
    "#{first_name} #{last_name}"
  end

  # def upcoming_events
  # return  @upcoming_events.all(:conditions=>['date > ?',Time.zone.now.beginning_of_day])
  # end

  def upcoming_events
    occasions.where("event_date > ?", Time.new)
   end

  def previous_events
    occasions.where("event_date < ?", Time.new)
   end
  # def previous_events
  #   @previous_events = current_user.event_date
  #   if(@previous_events<Time.now)
  #     @previous_events
  #   else
  #       return -1
  #   end
  # end

end
