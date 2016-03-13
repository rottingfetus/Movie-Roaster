class DeviseAction < ClassyEnum::Base
end

class DeviseAction::New < DeviseAction
end

class DeviseAction::Confirmed < DeviseAction
end

class DeviseAction::Login < DeviseAction
end

class DeviseAction::Password < DeviseAction
end

class DeviseAction::Unlocked < DeviseAction
end

class DeviseAction::Edit < DeviseAction
end

class DeviseAction::Delete < DeviseAction
end
