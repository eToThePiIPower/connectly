# Users:Registrations
# Override the Devise Registration controller to add authentication for
# ActiveStorage avatars
class Users::RegistrationsController < Devise::RegistrationsController
  def update
    @user = current_user
    user_updated = update_resource(@user, account_update_params)
    yield @user if block_given?

    if user_updated
      respond_for_valid_update
    else
      respond_for_invalid_update
    end
  end
end

private

def flash_key
  prev_unconfirmed_email = nil # @user.unconfirmed_email
  if update_needs_confirmation?(@user, prev_unconfirmed_email)
    :update_needs_confirmation
  else
    :updated
  end
end

def respond_for_valid_update
  set_flash_message :notice, flash_key if is_flashing_format?
  bypass_sign_in @user, scope: :user
  avatar = params[:user][:profile_attributes][:avatar]
  @user.profile.attach_avatar(avatar)
  respond_with @user, location: after_update_path_for(@user)
end

def respond_for_invalid_update
  clean_up_passwords @user
  set_minimum_password_length
  respond_with @user
end
