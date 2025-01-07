require 'rails_helper'

RSpec.describe "languages/show", type: :view do
  before(:each) do
    assign(:language, Language.create!(
      name: "Name",
      file_share_folder: "File Share Folder"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/File Share Folder/)
  end
end
