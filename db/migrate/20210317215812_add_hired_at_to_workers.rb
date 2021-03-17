class AddHiredAtToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :hired_at, :date
  end
end
