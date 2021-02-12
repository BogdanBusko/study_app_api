require 'json_web_token'

class AuthSession
  def initialize(request)
    token = request.headers['Authorization'].to_s.remove('Bearer ')
    @data = JsonWebToken.decode(token) || {}
  end

  def user_id
    @data['user_id']
  end
end
