class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.references :duser, foreign_key: true
      t.string :devtype
      t.string :subtype
      t.string :brand
      t.string :model
      t.string :color
      t.string :comments

      t.timestamps
    end
  end
end
