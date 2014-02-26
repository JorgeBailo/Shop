class DeleteUpdatedatToProducts < ActiveRecord::Migration
  def up
    remove_column :products, :updated_at
  end
  
  def down
    create_column :products, :updated_at, :datetime
  end
end
