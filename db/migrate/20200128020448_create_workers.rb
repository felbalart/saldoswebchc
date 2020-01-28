class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.integer :rut
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
