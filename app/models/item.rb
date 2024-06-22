class Item < ApplicationRecord
    enum :item_type, [ :ingredient, :packaging, :cleaning]

    belongs_to :list
end
