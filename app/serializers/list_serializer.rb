class ListSerializer
  include JSONAPI::Serializer
  set_type :list
  attributes :name

  has_many :items

end