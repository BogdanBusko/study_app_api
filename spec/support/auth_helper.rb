module AuthHelper
  def auth_header
    { headers: { 'Authorization': current_user.token } }
  end

  def current_user
    @user ||= FactoryBot.create(:user)
  end
end
