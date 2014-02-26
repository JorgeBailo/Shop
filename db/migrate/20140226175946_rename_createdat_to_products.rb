class RenameCreatedatToProducts < ActiveRecord::Migration
  def up
    rename_column :products, :created_at, :registered_at
  end
  
  def down
    rename_column :products, :registered_at, :created_at
  end
end
