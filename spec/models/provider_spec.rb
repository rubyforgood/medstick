require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    subject { FactoryBot.build(:provider) }
    it { should have_many :users }
    it { should have_many :topics }
  end
end
