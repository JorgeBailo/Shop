class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :name
      t.text :description
      t.string :manufacturer
      t.integer :units

      t.timestamps
    end
  end
end
