class RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_up_path_for(resource)
    if user_signed_in?
            edit_user_path(current_user)
    end
  end
end