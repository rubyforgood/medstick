require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      email_address: "Email Address",
      password: "Password",
      is_admin: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email address/)
    expect(rendered).to match(/false/)
  end
end
