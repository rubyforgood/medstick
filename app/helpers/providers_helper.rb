module ProvidersHelper
  def edit_link(provider)
    link_to '<i class="bi bi-pencil-square"></i> Edit'.html_safe, edit_provider_path(provider)
  end

  def destroy_link(provider)
    button_to "Destroy this provider", @provider, method: :delete, class: "btn btn-danger"
  end
end
