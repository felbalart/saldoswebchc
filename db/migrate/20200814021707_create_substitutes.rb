class CreateSubstitutes < ActiveRecord::Migration[5.2]
  def change
    create_table :substitutes do |t|
      t.references :product, foreign_key: true
      t.string :name
      t.string :author
      t.boolean :active

      t.timestamps
    end
  end
end
