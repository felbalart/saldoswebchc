class Survey < ApplicationRecord
end

# == Schema Information
#
# Table name: surveys
#
#  id         :bigint(8)        not null, primary key
#  company    :string
#  sic_number :integer
#  title      :string
#  quality    :integer
#  speed      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
