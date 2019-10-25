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

module ProductsHelper
end
