# User: Holds state and behavior related to identification and authentication
# Profiles and other extended information should be held in a profile class
# Username is included in the class to allow for identification via username OR email
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :username,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 6, maximum: 32 }
end
