require 'rails_helper'

RSpec.describe "Topics", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:user, is_admin: true) }

  let(:topic) { FactoryBot.create(:topic) }

  describe "GET /index" do
    it "returns http success" do
      login_as(admin_user)
      get topics_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      login_as(admin_user)
      get topic_url(topic)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      login_as(admin_user)
      get new_topic_url
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET /create" do
  #   it "returns http success" do
  #     login_as(admin_user)
  #     get "/topics/create"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET /edit" do
    it "returns http success" do
      login_as(admin_user)
      get edit_topic_url(topic)
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET /update" do
  #   it "returns http success" do
  #     get "/topics/update"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /destroy" do
  #   it "returns http success" do
  #     get "/topics/destroy"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
