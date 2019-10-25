require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Group/)
    expect(rendered).to match(/Subgroup/)
    expect(rendered).to match(/6/)
  end
end
