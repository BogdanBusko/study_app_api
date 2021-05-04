class OrganizationSerializer
  include JSONAPI::Serializer

  attribute :id, :name
end
