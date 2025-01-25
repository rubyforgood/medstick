class Topic < ApplicationRecord
  validates :description, presence: true
  validates :title, presence: true
  validates :title, uniqueness: true

  belongs_to :language
  belongs_to :provider

  enum :state, [ :active, :archived ]
end
