require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:file_share_folder) }
  end
end
