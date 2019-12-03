class CreateComponents < ActiveRecord::Migration[5.2]
  def change
    create_table :components, id: false do |t|
      t.integer :father_id, null: false
      t.integer :child_id, null: false
    end
  end
end
