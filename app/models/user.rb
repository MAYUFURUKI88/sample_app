class User < ApplicationRecord
before_save {email.downcase!}
  with_options presence: true do
    validates :name, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, length: {maximum: 255},
               format:{with: VALID_EMAIL_REGEX },
               uniqueness: true
    validates :password, length: {minimum: 6}
  end
  has_secure_password
end
