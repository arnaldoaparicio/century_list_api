class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :minimum
      t.integer :number_in_stock

      t.timestamps
    end
  end
end
