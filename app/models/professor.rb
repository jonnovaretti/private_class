class Professor < ApplicationRecord
  VALID_EMAIL_EXPRESSION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password

  before_save { self.email = email.downcase }

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 20 }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_EXPRESSION }
end
