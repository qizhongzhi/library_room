class RegistrationsController < Devise::RegistrationsController

	prepend_before_action :require_no_authentication, only: [:new]

  def create
    super #Nothing special here.
  end

  protected

  def sign_up(resource_name, resource)
    true
  end

  def after_sign_up_path_for(resource)
    if user_signed_in?
            edit_user_path(resource)
    else
    	sign_up(resource_name, resource)
    	edit_user_path(resource)
    end
  end

end