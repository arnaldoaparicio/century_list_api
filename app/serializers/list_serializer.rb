class ListSerializer
  include JSONAPI::Serializer
  set_type :list
  attributes :name, :items

  has_many :items

end