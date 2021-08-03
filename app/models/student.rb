class Student < ApplicationRecord
  VALID_EMAIL_EXPRESSION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }, 
                    format: { with: VALID_EMAIL_EXPRESSION }
end