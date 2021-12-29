class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_many :articles

    validates :username, presence: true, 
                            uniqueness: { case_sensitive: false }, 
                            length: { in: 3..25 }
    VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        format: { with: VALID_EMAIL_FORMAT, message: "enter a valid email" }
    has_secure_password
end