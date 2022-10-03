class Book < ApplicationRecord
  validates :title, :number_of_pages, :blurb, presence: true
end
