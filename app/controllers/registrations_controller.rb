class RegistrationsController < Devise::RegistrationsController
  private
  def build_resource(*args)
    super
    if session["devise.omniauth"]
      @user.apply_omniauth(session["devise.omniauth"])
      @user.valid?
    else
      @user.set_name_from_email unless @user.email.blank?
    end
  end
end
