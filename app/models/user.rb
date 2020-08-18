# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def to_s
    "#{first_name} #{last_name}"
  end
end
