class Placement < ApplicationRecord
  belongs_to :book
  belongs_to :shelf

  validates :book, :shelf, presence: true

  validates :book, uniqueness: { scope: :shelf, message: "This book has already been added to this shelf" }
end
