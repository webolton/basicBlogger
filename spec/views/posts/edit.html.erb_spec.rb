require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :user_id => 1,
      :body => "MyString",
      :status => 1,
      :parent_id => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_user_id[name=?]", "post[user_id]"

      assert_select "input#post_body[name=?]", "post[body]"

      assert_select "input#post_status[name=?]", "post[status]"

      assert_select "input#post_parent_id[name=?]", "post[parent_id]"
    end
  end
end
