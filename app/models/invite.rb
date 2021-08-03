require 'date'

class Invite < ApplicationRecord
  VALID_EMAIL_EXPRESSION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :student_email, presence: true, format: { with: VALID_EMAIL_EXPRESSION }
  validates :identifier, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :professor
  before_save { self.valid_until = Date.today + 3 }
end
