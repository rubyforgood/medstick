require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user) }
    it { should validate_presence_of(:email_address) }
    it { should validate_uniqueness_of(:email_address).ignoring_case_sensitivity }
  end

  describe 'associations' do
    subject {FactoryBot.build(:user) }
    it { should belong_to(:provider).optional }
  end
end
