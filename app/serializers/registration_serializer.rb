class RegistrationSerializer
  include JSONAPI::Serializer

  attributes :token

  attribute :user do |user|
    UserSerializer.new(user)
  end
end
