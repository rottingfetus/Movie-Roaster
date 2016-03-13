class LocalDevise::UnlocksController < Devise::UnlocksController

  private

  def after_unlock_path_for(resource)
    DeviseUsageLog.log(resource, DeviseAction::Unlocked)
    new_session_path(resource)
  end

end