class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauth_providers => [:google_oauth2, :facebook, :twitter]

  has_many :authentications
  has_many :check_list_definitions
  has_many :check_lists

  def add_provider!(auth)
    authentications.create!(
      provider: auth.provider,
      uid: auth.uid,
      token: auth.credentials.token,
      token_secret: auth.credentials.secret
    )
  end

  def apply_omniauth(auth)
    self.email = auth.info.email if email.blank?
    self.name = auth.info.name if name.blank?
    self.avatar = auth.info.image if avatar.blank?
    authentications.build(
      provider: auth.provider,
      uid: auth.uid,
      token: auth.credentials.token,
      token_secret: auth.credentials.secret
    )
  end
 
  def set_name_from_email
    self.name = email.split("@")[0] if name.blank?
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  # OK to update a user without a password (otherwise validation fails)
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def to_s
    if name.present?
      name
    elsif email.present?
      email.split('@')[0]
    else
      "user#{id}"
    end
  end
end
