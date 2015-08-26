require 'rails_helper'

RSpec.describe "favorites/index", type: :view do
  before(:each) do
    assign(:favorites, [
      Favorite.create!(
        :user_id => 1,
        :post_id => 2
      ),
      Favorite.create!(
        :user_id => 1,
        :post_id => 2
      )
    ])
  end

  it "renders a list of favorites" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
