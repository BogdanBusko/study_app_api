require 'auth_session'

class ApplicationController < ActionController::API
  before_action :current_session

  def current_session
    @current_session ||= AuthSession.new(request)
  end

  def current_user
    return unless current_session.user_id

    @current_user ||= User.find(current_session.user_id)
  end

  private

  def authenticate_user!
    head(:unauthorized) unless current_user
  end
end
