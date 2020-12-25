class Api::V1::BaseController < ApplicationController
  private

  def authenticate_user!
    return if current_user

    head(:unauthorized)
  end
end
