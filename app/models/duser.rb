class Duser < ApplicationRecord
  has_many :devices

  def u3l
    last_name1.downcase.strip[0..2]
  end

  def alias
    email&.split('@')&.first
  end

def email_ofusc
  ofuscate email
end
def mobile_phone_num_ofusc
  ofuscate mobile_phone_num
end
def fixed_device_num_ofusc
  ofuscate fixed_device_num
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

  def ofuscate str
    return str if str.to_s.length < 4
    str[0..3] + (['*']*(str.length - 8)).join + str[-4..-1]
  end

  def ofuscate_end(str, show_n)
    str = str.to_s
    return str if str.length < show_n
    str[0...show_n] + (['*']*(str.length - show_n)).join
  end

  def truncate_end(str, show_n)
    str = str.to_s
    return str if str.length < show_n
    str[0...show_n] + '...'
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
