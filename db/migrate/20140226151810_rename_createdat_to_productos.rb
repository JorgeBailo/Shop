class RenameCreatedatToProductos < ActiveRecord::Migration
  def up
    rename_column :productos, :created_at, :registred_at
  end
  
  def down
    rename_column :productos, :registred_at, :created_at
  end
end
