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
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Email address".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
