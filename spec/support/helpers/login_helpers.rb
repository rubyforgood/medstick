  def login_as(user)
    # visit login_path
    # fill_in "Email Address", with: user.email_address
    # fill_in "Password", with: user.password
    # click_button "Log in"
    post session_url, params: { email_address: user.email_address, password: user.password }
  end
