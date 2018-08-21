# Profile: Extended profile data concerning a specific user
class Profile < ApplicationRecord
  belongs_to :user
end
