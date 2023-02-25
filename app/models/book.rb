class Book < ApplicationRecord

  has_many :placements, dependent: :destroy
  has_many :contributions, dependent: :destroy
  belongs_to :user, optional: true

  validates :title, :number_of_pages, :blurb, presence: true

  def long?
    number_of_pages > 500
  end

  def contributors
    contributions.includes(:contributor)
                 .map { |contribution| { role: contribution.role, name: contribution.contributor.name } }
  end

  def authors
    contributors.select { |contributor| contributor[:role] == 'author' }
  end
end
