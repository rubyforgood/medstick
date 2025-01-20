require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        email_address: "Email Address",
        password: "Password",
        is_admin: false
      ),
      User.create!(
        email_address: "Email Address2",
        password: "Password2",
        is_admin: false
      )
    ])
  end

  it "renders a list of users" do
    render
    cell_selector = 'tr.user-listing'
    assert_select cell_selector, text: Regexp.new("email address".to_s), count: 2
  end
end
