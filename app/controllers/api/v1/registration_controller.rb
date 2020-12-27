class Api::V1::RegistrationController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: SessionSerializer.new(user), status: 201
    else
      render json: ErrorsSerializer.new(user), status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
