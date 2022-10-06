class Book < ApplicationRecord
  has_many :placements, dependent: :destroy
  validates :title, :number_of_pages, :blurb, presence: true
end
