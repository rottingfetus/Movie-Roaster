class LocalDevise::PasswordsController < Devise::PasswordsController

  private

  def after_resetting_password_path_for(resource)
    DeviseUsageLog.log(resource, DeviseAction::Password)
    stored_location_for(resource) || signed_in_root_path(resource)
  end

end