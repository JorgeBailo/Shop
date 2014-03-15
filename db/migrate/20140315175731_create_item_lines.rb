class CreateItemLines < ActiveRecord::Migration
  def change
    create_table :item_lines do |t|
      t.integer :quantity
      t.decimal :price
      t.references :order, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
