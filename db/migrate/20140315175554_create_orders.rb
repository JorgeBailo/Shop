class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_status
      t.string :payment
      t.text :address
      t.string :city
      t.string :buyer_name
      t.string :buyer_lastname

      t.timestamps
    end
  end
end
