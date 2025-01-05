module UsersHelper
  def current_user_name
    return "" unless Current.user.present?
    Current.user.email_address
  end

  def current_user_is_admin?
    return false unless Current.user.present?
    Current.user.is_admin?
  end
end
