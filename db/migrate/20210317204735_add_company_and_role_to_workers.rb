class AddCompanyAndRoleToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :company, :string
    add_column :workers, :role, :string
  end
end
