require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :user_id => 1,
      :body => "MyString",
      :status => 1,
      :parent_id => "MyString"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_user_id[name=?]", "post[user_id]"

      assert_select "input#post_body[name=?]", "post[body]"

      assert_select "input#post_status[name=?]", "post[status]"

      assert_select "input#post_parent_id[name=?]", "post[parent_id]"
    end
  end
end
