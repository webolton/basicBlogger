require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :full_name => "Full Name",
      :user_name => "User Name",
      :email => "Email",
      :avatar => "",
      :password_hash => "Password Hash",
      :password_salt => "Password Salt",
      :bio => "Bio",
      :admin => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/User Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Password Hash/)
    expect(rendered).to match(/Password Salt/)
    expect(rendered).to match(/Bio/)
    expect(rendered).to match(/false/)
  end
end
