require 'rails_helper'

RSpec.describe "topics/index.html.erb", type: :view do
  before(:each) do
    assign(:topics, [
      FactoryBot.create(:topic), FactoryBot.create(:topic)
    ])
  end

  it "renders a list of topics" do
    render
    cell_selector = 'tr.topic-listing'
    assert_select cell_selector, text: Regexp.new("MyString".to_s), count: 2
  end
end
