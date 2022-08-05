class AddLogToDevice < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :log, :string
  end
end
