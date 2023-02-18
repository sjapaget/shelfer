class Book < ApplicationRecord

  has_many :placements, dependent: :destroy
  has_many :contributions, dependent: :destroy

  validates :title, :number_of_pages, :blurb, presence: true

  def long?
    number_of_pages > 500
  end

  def authors
    author_contributions = contributions.where(role: 'author')
    author_contributions.map(&:contributor)
  end
end
