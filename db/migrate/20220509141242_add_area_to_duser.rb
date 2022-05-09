class AddAreaToDuser < ActiveRecord::Migration[5.2]
  def change
    add_column :dusers, :area, :string
  end
end
