module ApplicationHelper
  def sidebar
    render partial: "layouts/sidebar"
  end

  def linked_logo
    render partial: "layouts/linked_logo"
  end

  def nav_link(label, path)
    render partial: "layouts/nav_link", locals: { label: label, path: path }
  end
end
