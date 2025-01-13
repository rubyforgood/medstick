require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
context "current_user_name" do
  describe "user logged in" do
    it "returns the current user's email address" do
      user = FactoryBot.build(:user, email_address: "test@user.use")
      allow(Current).to receive(:user).and_return(user)
      expect(helper.current_user_name).to eq("test@user.use")
    end
  end

  describe "user not logged in" do
    it "returns an empty string" do
      allow(Current).to receive(:user).and_return(nil)
      expect(helper.current_user_name).to eq("")
    end
  end
end
  describe "user logged in" do
    it "returns true if the current user is an admin" do
      user = FactoryBot.build(:user, :admin)
      allow(Current).to receive(:user).and_return(user)
      expect(helper.current_user_is_admin?).to be true
    end

    it "returns false if the current user is not an admin" do
      user = FactoryBot.build(:user)
      allow(Current).to receive(:user).and_return(user)
      expect(helper.current_user_is_admin?).to be false
    end
  end

  describe "user not logged in" do
    it "current_user_is_admin returns false" do
      allow(Current).to receive(:user).and_return(nil)
      expect(helper.current_user_is_admin?).to be false
    end
  end
end
