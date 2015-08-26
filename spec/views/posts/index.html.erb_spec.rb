require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :user_id => 1,
        :body => "Body",
        :status => 2,
        :parent_id => "Parent"
      ),
      Post.create!(
        :user_id => 1,
        :body => "Body",
        :status => 2,
        :parent_id => "Parent"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Parent".to_s, :count => 2
  end
end
