class Api::V1::RegistrationController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      head(:ok)
    else
      render json: {
        errors: user.errors.full_messages
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
