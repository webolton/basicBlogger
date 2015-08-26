require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :full_name => "MyString",
      :user_name => "MyString",
      :email => "MyString",
      :avatar => "",
      :password_hash => "MyString",
      :password_salt => "MyString",
      :bio => "MyString",
      :admin => false
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_full_name[name=?]", "user[full_name]"

      assert_select "input#user_user_name[name=?]", "user[user_name]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_avatar[name=?]", "user[avatar]"

      assert_select "input#user_password_hash[name=?]", "user[password_hash]"

      assert_select "input#user_password_salt[name=?]", "user[password_salt]"

      assert_select "input#user_bio[name=?]", "user[bio]"

      assert_select "input#user_admin[name=?]", "user[admin]"
    end
  end
end
