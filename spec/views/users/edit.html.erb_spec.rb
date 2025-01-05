require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      email_address: "MyString",
      password: "MyString",
      is_admin: false
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do
      assert_select "input[name=?]", "user[email_address]"

      assert_select "input[name=?]", "user[is_admin]"
    end
  end
end
