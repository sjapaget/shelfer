class Shelf < ApplicationRecord
  belongs_to :user
  has_many :placements, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
