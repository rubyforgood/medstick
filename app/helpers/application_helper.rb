module ApplicationHelper
  def sidebar
    render partial: "layouts/sidebar"
  end

  def linked_logo
    render partial: "layouts/linked_logo"
  end

  def nav_link(label, path, icon = "file-earmark-medical-fill")
    render partial: "layouts/nav_link", locals: { label: label, path: path, icon: icon }
  end

  def active_class(path)
    if path.is_a?(String)
      current_page?(path) ? "active" : ""
    else
      controller_name == path.to_s.split("/").first ? "active" : ""
    end
  end

  def submit_button(form, label = "Submit")
    form.submit label, class: "btn btn-primary me-1 mb-1"
  end

  def show_page_tool_link(item, label = "Show")
    link_to '<i class="bi bi-search"></i>'.html_safe, item, class: "btn btn-primary btn-sm", aria: { label: label }
  end

  def delete_tool_link(item, label = "Delete")
    link_to '<i class="bi bi-trash"></i>'.html_safe, item, method: :delete, data: { confirm: "Are you sure?" }, class: "btn btn-danger btn-sm"
  end
end
