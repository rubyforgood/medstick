require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the LanguagesHelper. For example:
#
# describe LanguagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe "sidebar" do
    it "returns the sidebar" do
      expect(helper.sidebar).to include('id="sidebar"')
    end
  end

  describe "active_class" do
    it "returns active when the current page is the same as the page" do
      allow(helper).to receive(:current_page?).and_return(true)
      expect(helper.active_class("/")).to eq("active")
    end

    it "returns empty string when the current page is not the same as the page" do
      allow(helper).to receive(:current_page?).and_return(false)
      expect(helper.active_class("/")).to eq("")
    end
  end
end
