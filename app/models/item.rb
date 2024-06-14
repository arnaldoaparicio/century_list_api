class Item < ApplicationRecord
    enum :item_type, [ :ingredient, :packaging, :cleaning]
end
