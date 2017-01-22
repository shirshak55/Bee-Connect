class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation,:is_female)
  end

  def account_update_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation, :current_password,:is_female)
  end
end
