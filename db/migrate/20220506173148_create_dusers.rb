class CreateDusers < ActiveRecord::Migration[5.2]
  def change
    create_table :dusers do |t|
      t.string :names
      t.string :last_name1
      t.string :last_name2
      t.string :rut
      t.string :workplace
      t.string :email
      t.string :mobile_phone_num
      t.string :mobile_line_owner
      t.string :mobile_device_owner
      t.string :fixed_device_num

      t.timestamps
    end
  end
end
