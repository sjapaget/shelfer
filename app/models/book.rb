class Book < ApplicationRecord
  has_many :contributions, dependent: :destroy

  validates :title, :number_of_pages, :blurb, presence: true
end
