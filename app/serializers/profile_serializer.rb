class ProfileSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :email, :full_name
end
