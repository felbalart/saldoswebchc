class Worker < ApplicationRecord
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
#
