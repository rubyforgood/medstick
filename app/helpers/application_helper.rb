module ApplicationHelper
  def sidebar
    render partial: "layouts/sidebar"
  end

  def linked_logo
    render partial: "layouts/linked_logo"
  end
end
