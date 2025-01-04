require 'rails_helper'

RSpec.describe "Statics", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/static/index"
      expect(response).to have_http_status(:success)
    end
    it "renders the static index" do
      get root_path
      expect(response).to render_template :index
    end
  end

  describe "GET /page" do
    it "returns http success" do
      get "/static/page"
      expect(response).to have_http_status(:success)
    end
  end
end
