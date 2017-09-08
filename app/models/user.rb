class User < ApplicationRecord

  before_save { self.email = email.downcase }

  validates :username, presence: true, uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
    length: { maximum: 105 },
    format: { with: VALID_EMAIL_REGEX }

  validates :password, length: { minimum: 8, maximum: 30 }
#  VALID_PASSWORD_REGEX = /\A((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,})\z/
#  validates :password, format: { with: VALID_PASSWORD_REGAX }
#  message: " must contain at least one number, one uppercase and one lowercase letter with a minimum length of 8 chars."
  has_secure_password
end
