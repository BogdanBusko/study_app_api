class Api::V1::SessionsController < Api::V1::BaseController
  def create
    user = User.find_by(email: params[:session][:email])

    if user&.authenticate(params[:session][:password])
      render json: SessionSerializer.new(user), status: 201
    else
      head(:unauthorized)
    end
  end
end
