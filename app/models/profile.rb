# Profile: Extended profile data concerning a specific user
class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar

  def attach_avatar(new_avatar)
    return unless new_avatar
    avatar.attach(new_avatar)
  end

  def avatar?
    avatar.attached?
  end
end
