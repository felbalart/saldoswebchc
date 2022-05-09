class Duser < ApplicationRecord
  has_many :devices

  def u3l
    last_name1.downcase.strip[0..2]
  end
end

# == Schema Information
#
# Table name: dusers
#
#  id                  :bigint(8)        not null, primary key
#  names               :string
#  last_name1          :string
#  last_name2          :string
#  rut                 :string
#  workplace           :string
#  email               :string
#  mobile_phone_num    :string
#  mobile_line_owner   :string
#  mobile_device_owner :string
#  fixed_device_num    :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
