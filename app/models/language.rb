class Language < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :file_share_folder, presence: true

  has_many :topics
end
