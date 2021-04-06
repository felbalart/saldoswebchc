class AddAreaTrabajoToSalvoconductos < ActiveRecord::Migration[5.2]
  def change
    add_column :salvoconductos, :area_trabajo, :string
  end
end
