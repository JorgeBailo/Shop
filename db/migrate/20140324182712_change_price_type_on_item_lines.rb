class ChangePriceTypeOnItemLines < ActiveRecord::Migration
  def up
    change_column :item_lines, :price, :decimal, :precision => 8, :scale => 2
  end

  def down
    change_column :item_lines, :price, :decimal, :precision => 10, :scale => 0
  end
end
