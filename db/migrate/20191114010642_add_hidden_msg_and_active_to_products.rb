class AddHiddenMsgAndActiveToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :hidden_msg, :string
    add_column :products, :active, :boolean
  end
end
