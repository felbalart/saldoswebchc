class Product < ApplicationRecord
  default_scope { where('priority > 0').order('priority desc') }


  def self.search(search)
    if search
      where("LOWER(name) like ? or LOWER(code) like ?", "%#{search.downcase}%", "%#{search.downcase}%")
    else
      all
    end
  end

  def get_image_url
    return '/no_pic.png' unless image_url.present?
    image_url
  end

  def get_name
    name.gsub('Comercial', 'CM').gsub('comercial', 'CM').gsub('COMERCIAL', 'CM')
  end


  def stock_estimate
    if stock <= 15
      "Aprox #{stock} UN"
    elsif stock > 15 && stock <=20
      "Más de 15 UN"
    elsif stock < 100
      "Más de #{(stock + 1) / 10 * 10} UN"
    elsif stock < 1000
      "Más de #{(stock + 1) / 100 * 100} UN"
    else
    "Más de #{(stock + 1) / 1000 * 1000} UN"
    end
  end


  def self.gr_sgs
    gsg_data =
    {
      'Griferia' => ['Grif cocina','Grif habitacional', 'Grif institucional'],
      'Loza' => ['Lavamanos', 'Sanitarios', 'Urinarios'],
      'Prod. grandes' =>
      ['Bañera, hidro, faldón',
      'Cabinas, spas, saunas',
      'Espejos',
      'Mamparas',
      'Muebles',
      'Platos de ducha'],
      'Revestimientos' =>
      ['Cerámica de muro',
      'Fotolaminados',
      'Porcelanato, gres, cer piso'],
      'Acces. y freg' =>['Acc. Hab', 'Acc. Inst', 'Lavaplatos'],
      'Repuestos' => [],
      # Rep. hab e inst
      'Complementos y otros' => []
      # ['Divisiones', 'Otros'],
    }

    gsg_data.map { |k,v| ["#{k} (#{g_count(k)})", v.map {|sg| "#{sg} (#{sg_count(sg)})"}] }
  end

  def self.g_count(g)
    @gdata ||= Product.pluck(:group).group_by(&:to_s).map { |k,v| [k, v.count] }.to_h
    @gdata[g]
  end

  def self.sg_count(sg)
    @sgdata ||= Product.pluck(:subgroup).group_by(&:to_s).map { |k,v| [k, v.count] }.to_h
    @sgdata[sg]
  end
end

# == Schema Information
#
# Table name: products
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  brief         :text
#  base_price    :integer
#  discount      :integer
#  sale_price    :integer
#  stock         :integer
#  second_class  :boolean
#  group         :string
#  subgroup      :string
#  priority      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  code          :string
#  brand         :string
#  image_url     :string
#  datasheet_url :string
#
