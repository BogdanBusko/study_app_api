class Api::V1::Account::ProfilesController < Api::V1::Account::AccountController
  def show
    render json: UserSerializer.new(current_user), status: 200
  end
end