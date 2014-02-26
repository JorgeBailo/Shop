class RenameCreatedatToProductos < ActiveRecord::Migration
  def up
    rename_column :productos, :created_at, :registered_at
  end
  
  def down
    rename_column :productos, :registered_at, :created_at
  end
end
