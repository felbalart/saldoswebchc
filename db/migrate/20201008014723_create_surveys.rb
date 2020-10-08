class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :company
      t.integer :sic_number
      t.string :title
      t.integer :quality
      t.integer :speed

      t.timestamps
    end
  end
end
