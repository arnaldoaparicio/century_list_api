class ListSerializer
  include JSONAPI::Serializer
  set_type :lists
  attributes :name

  has_many :items

end