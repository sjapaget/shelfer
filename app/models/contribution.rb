class Contribution < ApplicationRecord

  belongs_to :book
  belongs_to :contributor

  validates :book, :contributor, :role, presence: true
  validate :unique_combination_of_book_contributor_and_role

  def name
    contributor.name
  end

  private

  def unique_combination_of_book_contributor_and_role
    identical_contributions = Contribution.where(book: book, contributor: contributor, role: role)
    errors.add(:contributor, "this contribution already exists") if identical_contributions.count.positive?
  end
end
