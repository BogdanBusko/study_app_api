class JsonWebToken
  class << self
    def encode(payload)
      JWT.encode({ data: payload }, Rails.application.credentials.jwt_secret, 'HS256')
    end

    def decode(token)
      begin
        JWT.decode(token, Rails.application.credentials.jwt_secret, true, { algorithm: 'HS256' })[0]['data']
      rescue JWT::DecodeError
        nil
      end
    end
  end
end
