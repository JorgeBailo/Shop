class DeleteUpdatedatToProductos < ActiveRecord::Migration
  def up
    remove_column :productos, :updated_at
  end
  
  def down
    create_column :productos, :updated_at, :datetime
  end
end
