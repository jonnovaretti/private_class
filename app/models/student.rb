class Student < ApplicationRecord
  VALID_EMAIL_EXPRESSION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password

  belongs_to :professor

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_EXPRESSION }

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 20 }

  validates :password, presence: true
  validates :password, confirmation: { case_sensitive: true }
end
