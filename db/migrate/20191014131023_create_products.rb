class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :brief
      t.integer :base_price
      t.integer :discount
      t.integer :sale_price
      t.integer :stock
      t.boolean :second_class
      t.string :group
      t.string :subgroup
      t.integer :priority

      t.timestamps
    end
  end
end
