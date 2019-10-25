require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "MyString",
      :brief => "",
      :base_price => 1,
      :discount => 1,
      :sale_price => 1,
      :stock => 1,
      :second_class => "",
      :group => "MyString",
      :subgroup => "MyString",
      :priority => 1
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[brief]"

      assert_select "input[name=?]", "product[base_price]"

      assert_select "input[name=?]", "product[discount]"

      assert_select "input[name=?]", "product[sale_price]"

      assert_select "input[name=?]", "product[stock]"

      assert_select "input[name=?]", "product[second_class]"

      assert_select "input[name=?]", "product[group]"

      assert_select "input[name=?]", "product[subgroup]"

      assert_select "input[name=?]", "product[priority]"
    end
  end
end
