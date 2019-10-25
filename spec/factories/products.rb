FactoryBot.define do
  factory :product do
    name { "MyString" }
    brief { "" }
    base_price { 1 }
    discount { 1 }
    sale_price { 1 }
    stock { 1 }
    second_class { "" }
    group { "MyString" }
    subgroup { "MyString" }
    priority { 1 }
  end
end
