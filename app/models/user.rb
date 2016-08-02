class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one  :cart
  before_save { email.downcase! }

  # VALIDATION
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,
            presence: true,
            length: { maximum: 50, message: 'Too long yow' }

  validates :email,
            presence: true,
            length: { maximum: 50 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }


  # FOR HASHING PASSWORD
  has_secure_password

end
