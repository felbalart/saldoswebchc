class AddDatasheetUrlToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :datasheet_url, :string
  end
end
