require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    # it { should validate_uniqueness_of(:title) }
  end

  describe 'associations' do
    subject { FactoryBot.build(:topic) }
    it { should belong_to(:provider) }
    it { should belong_to(:language) }
  end
end
