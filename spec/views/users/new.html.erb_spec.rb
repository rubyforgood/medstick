require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      email_address: "MyString",
      password: "MyString",
      is_admin: false
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input[name=?]", "user[email_address]"

      assert_select "input[name=?]", "user[password]"

      assert_select "input[name=?]", "user[is_admin]"
    end
  end
end
