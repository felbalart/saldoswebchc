class Substitute < ApplicationRecord
  belongs_to :product
end

# == Schema Information
#
# Table name: substitutes
#
#  id         :bigint(8)        not null, primary key
#  product_id :bigint(8)
#  name       :string
#  author     :string
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_substitutes_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
