class User < ActiveRecord::Base
  validates :username, presence: true, 
            uniqueness: { case_sensitive: false }, 
            #ensures unique username + no case sense (joe = Joe = jOE)
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX} 
            #using regex for proper email address format
end






