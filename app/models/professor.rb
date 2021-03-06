class Professor < ApplicationRecord
  VALID_EMAIL_EXPRESSION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password

  has_many :invites, dependent: :destroy
  has_many :students
  
  before_save { self.email = email.downcase }

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 20 }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }, 
                    format: { with: VALID_EMAIL_EXPRESSION }

  validates :password, presence: true
  validates :password, confirmation: { case_sensitive: true }
end
