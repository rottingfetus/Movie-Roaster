class LocalDevise::RegistrationsController < Devise::RegistrationsController

  def destroy
    DeviseUsageLog.log(resource, DeviseAction::Delete)
    super
  end

  private

  def after_inactive_sign_up_path_for(resource)
    DeviseUsageLog.log(resource, DeviseAction::New)
    root_path
  end

  def after_sign_up_path_for(resource)
    DeviseUsageLog.log(resource, DeviseAction::New)
    stored_location_for(resource) || signed_in_root_path(resource)
  end

  def after_update_path_for(resource)
    DeviseUsageLog.log(resource, DeviseAction::Edit)
    root_url
  end

end