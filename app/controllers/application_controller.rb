require 'auth_session'

class ApplicationController < ActionController::API
  before_action :current_session

  def current_session
    @current_session ||= AuthSession.new(request)
  end

  def current_user
    @current_user ||= User.find(current_session.user_id)
  end

  private

  def authenticate_user!
    return if current_user

    head(:unauthorized)
  end
end
