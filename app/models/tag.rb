class Tag < ApplicationRecord
  belongs_to :product
end

# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  product_id :bigint(8)
#  word       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
