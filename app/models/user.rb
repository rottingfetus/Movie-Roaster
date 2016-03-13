class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :movies
         has_many :reviews, dependent: :destroy
  
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid 
      user.email = auth.info.email
      user.save
    end
  end
  
  def self.valid_user?(resource)
    resource && resource.is_a?(User) && resource.valid?
  end

  def log_devise_action(new_action)
    DeviseUsageLog.create!(user_id: id, role: role, user_ip: current_sign_in_ip, username: username, action: new_action)
  end
  
  def self.new_with_session(params, session)
  if session["devise.user_attributes"]
    new(session["devise.user_attributes"], without_protection: true) do |user|
    user.attributes = params
    user.valid?
  end
  else
    super
  end
  end   
    def password_required?
      super && provider.blank?
    end
end
