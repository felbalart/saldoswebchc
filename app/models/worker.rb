class Worker < ApplicationRecord

  def cs?
    company == 'CS'
  end


  def company_name
   ENV.fetch("#{company}_NAME", 'NAME EXAMPLE')
  end

  def company_rut
   ENV.fetch("#{company}_RUT", '11.111.111-1')
  end

  def company_logo_url
   ENV.fetch("#{company}_LOGO_URL", 'https://www.logaster.com/blog/wp-content/uploads/2018/05/Canva.png')
  end

  def dv
    return nil if rut.blank?
    dvr='0'
    suma=0
    mul=2
    rut.to_s.reverse.split("").each do |c|
      suma=suma+c.to_i*mul
      if mul==7
        mul=2
      else
        mul+=1
      end
    end
    res=suma%11
    if res==1
      return 'k'
    elsif res==0
      return '0'
    else
      return 11-res
    end
  end
end

# == Schema Information
#
# Table name: workers
#
#  id         :bigint(8)        not null, primary key
#  rut        :integer
#  name       :string
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company    :string
#  role       :string
#  hired_at   :date
#
