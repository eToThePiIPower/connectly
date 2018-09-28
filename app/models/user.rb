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
    format: { with: /\A[a-zA-Z0-9._]+\z/,
              message: 'can only contain alphanumeric characters, underscores, or periods' },
    length: { minimum: 6, maximum: 32 }

  has_one :profile, dependent: :destroy
  has_many :contacts

  delegate :avatar?, to: :profile

  accepts_nested_attributes_for :profile, update_only: true
  after_initialize do
    build_profile if new_record? && profile.blank?
  end
end
