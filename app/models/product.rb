class Product < ApplicationRecord
  has_many :tags
  has_and_belongs_to_many(:products,
  join_table: :components,
  foreign_key: :father_id,
  association_foreign_key: :child_id)

  alias_attribute :components, :products
  default_scope { order('priority desc') }
  scope :active, -> { where(active: true) }



  def self.search(search)
    if search
      active.where("LOWER(name) like ? or LOWER(code) like ?", "%#{search.downcase}%", "%#{search.downcase}%")
    else
      active
    end
  end

  def self.with_tag(tag)
    return Product.active unless tag
    Product.includes(:tags).active.where(tags: {word: tag})
  end

  def self.gr_sgs(tag_word = nil)
    puts 'BEGIN DEBUG'
    puts tag_word.class
    puts tag_word
    puts 'END DEBUG'
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

    prs = with_tag(tag_word)
    gs_count_hash = prs.group_by(&:group).map {|k,v| [k, v.count]}.to_h
    sgs_count_hash = prs.group_by(&:subgroup).map {|k,v| [k, v.count]}.to_h

    gsg_data.map { |k,v| ["#{k} (#{gs_count_hash[k].to_i})", v.map {|sg| "#{sg} (#{sgs_count_hash[sg].to_i})"}] }
  end

  # deprecated
  def self.g_count(g)
    @gdata ||= Product.active.pluck(:group).group_by(&:to_s).map { |k,v| [k, v.count] }.to_h
    @gdata[g]
  end
  # deprecated
  def self.sg_count(sg)
    @sgdata ||= Product.active.pluck(:subgroup).group_by(&:to_s).map { |k,v| [k, v.count] }.to_h
    @sgdata[sg]
  end

  def full_display_name
    [id, code, name].join(' ')
  end

  def get_image_url
    return '/no_pic.png' unless image_url.present?
    return ('https://chc.cl/' + image_url) unless image_url.include?('http')
    image_url.split(' | ').first
  end

  def get_name
    name.gsub('Comercial', 'CM').gsub('comercial', 'CM').gsub('COMERCIAL', 'CM')
  end

  def get_base_price
    return base_price unless base_price == -1
    components.sum { |co| co.get_base_price }
  end

  def get_sale_price
    return sale_price unless sale_price == -1
    components.sum { |co| co.get_sale_price }
  end

  def get_discount
    return discount unless discount == -1
    (100.0 - (100.0 * get_sale_price.to_f / get_base_price.to_f)).round
  end

  def get_stock
    return stock unless stock == -1
    components.map(&:get_stock).min
  end


  def stock_estimate
    g_s = get_stock
    if g_s <= 15
      "Aprox #{g_s} UN"
    elsif g_s > 15 && g_s <=20
      "Más de 15 UN"
    elsif g_s < 100
      "Más de #{(g_s + 1) / 10 * 10} UN"
    elsif g_s < 1000
      "Más de #{(g_s + 1) / 100 * 100} UN"
    else
    "Más de 1000 UN"
    end
  end

  def tag_words
    tags.map(&:word)
  end

  def is_father?
    components.any?
  end

  def is_child?
    fathers.any?
  end

  def fathers
    Product.find(ActiveRecord::Base.connection.execute("select father_id from components where child_id = #{id}").values.flatten)
  end

  def brand_logo_url
    return if brand.blank?
    '/logos/' + brand.downcase.gsub(' ','_').gsub("'",'_').delete('.') + '.jpg'
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
#  hidden_msg    :string
#  active        :boolean
#
