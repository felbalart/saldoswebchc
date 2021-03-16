class AddRoleToSalvoconductos < ActiveRecord::Migration[5.2]
  def change
    add_column :salvoconductos, :role, :string
  end
end
