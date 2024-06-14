class AddItemTypeToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :item_type, :integer
  end
end
