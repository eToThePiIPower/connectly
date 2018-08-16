module DeviseHelper
  def devise_error_messages
    resource.errors.full_messages
  end

  def devise_error_messages?
    if defined?(resource)
      !resource.errors.empty?
    else
      false
    end
  end
end
