class ItemSerializer
  include JSONAPI::Serializer
  set_type :item
  attributes :name, :minimum, :number_in_stock, :item_type

  belongs_to :list
end