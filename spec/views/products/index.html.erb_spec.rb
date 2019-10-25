require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :name => "Name",
        :brief => "",
        :base_price => 2,
        :discount => 3,
        :sale_price => 4,
        :stock => 5,
        :second_class => "",
        :group => "Group",
        :subgroup => "Subgroup",
        :priority => 6
      ),
      Product.create!(
        :name => "Name",
        :brief => "",
        :base_price => 2,
        :discount => 3,
        :sale_price => 4,
        :stock => 5,
        :second_class => "",
        :group => "Group",
        :subgroup => "Subgroup",
        :priority => 6
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Group".to_s, :count => 2
    assert_select "tr>td", :text => "Subgroup".to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
