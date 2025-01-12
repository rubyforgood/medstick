module Authorization
  extend ActiveSupport::Concern

  included do
    before_action :require_admin_access
    helper_method :authorized?
  end

  class_methods do
    def allow_non_admin_access(**options)
      skip_before_action :require_admin_access, **options
    end
  end

  private

  def require_admin_access
    redirect_to dashboard_path, alert: "You are not authorized to access this page." unless authorized?
  end

  def authorized?
    Current.user&.is_admin?
  end
end
