class Api::V1::Account::ProfilesController < Api::V1::Account::AccountController
  def show
    render json: ProfileSerializer.new(current_user), status: 200
  end

  def update
    if current_user.update(user_params)
      render json: ProfileSerializer.new(current_user), status: 200
    else
      render json: ErrorsSerializer.new(current_user), status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
