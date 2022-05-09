class Duser < ApplicationRecord
  has_many :devices

  def u3l
    last_name1.downcase.strip[0..2]
  end

  def human_mobile_line_owner
  	case mobile_line_owner
  	when 'company_line'
  		'Empresa'
  	when 'personal_line'
  		'Personal'
  	end
  end

  def human_mobile_device_owner
      case mobile_device_owner
      when 'company_device'
        'Empresa'
      when 'personal_device'
        'Personal'
      when 'two_devices'
        '2 Dispositivos'
      end
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
#  area                :string
#
