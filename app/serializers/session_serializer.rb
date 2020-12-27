class SessionSerializer
  include JSONAPI::Serializer

  set_type :user

  attribute :token
end
