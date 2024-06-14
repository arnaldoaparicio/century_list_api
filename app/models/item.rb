class Item < ApplicationRecord
    enum :status, [ :ingredient, :packaging, :cleaning]
end
