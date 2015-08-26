require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :full_name => "Full Name",
        :user_name => "User Name",
        :email => "Email",
        :avatar => "",
        :password_hash => "Password Hash",
        :password_salt => "Password Salt",
        :bio => "Bio",
        :admin => false
      ),
      User.create!(
        :full_name => "Full Name",
        :user_name => "User Name",
        :email => "Email",
        :avatar => "",
        :password_hash => "Password Hash",
        :password_salt => "Password Salt",
        :bio => "Bio",
        :admin => false
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Password Hash".to_s, :count => 2
    assert_select "tr>td", :text => "Password Salt".to_s, :count => 2
    assert_select "tr>td", :text => "Bio".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
