class Book < ApplicationRecord

  has_many :placements, dependent: :destroy
  has_many :contributions, dependent: :destroy

  validates :title, :number_of_pages, :blurb, presence: true

  def long?
    number_of_pages > 500
  end

  def contributors
    role_name_pairs = {}
    contributions.includes(:contributor)
                 .map { |contribution| { contribution.role => contribution.contributor.name } }
                 .each { |key_val| hash.merge!(key_val) }
    role_name_pairs
  end

  def authors
    author_contributions = contributions.where(role: 'author')
    author_contributions.map(&:contributor)
  end
end
