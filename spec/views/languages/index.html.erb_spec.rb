require 'rails_helper'

RSpec.describe "languages/index", type: :view do
  before(:each) do
    assign(:languages, [
      Language.create!(
        name: "Name",
        file_share_folder: "File Share Folder"
      ),
      Language.create!(
        name: "Name2",
        file_share_folder: "File Share Folder"
      )
    ])
  end

  it "renders a list of languages" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("File Share Folder".to_s), count: 2
  end
end
