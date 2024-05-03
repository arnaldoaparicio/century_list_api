class ListSerializer
  include JSONAPI::Serializer
  set_type :lists
  attributes :name

end