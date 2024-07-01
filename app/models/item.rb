class Item < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :minimum
    validates_presence_of :number_in_stock
    validates_presence_of :item_type
    
    enum :item_type, [ :ingredient, :packaging, :cleaning]
    
    belongs_to :list
end
