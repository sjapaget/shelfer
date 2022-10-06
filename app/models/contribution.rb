class Contribution < ApplicationRecord
  # The list of accepted values for contribution.role
  ROLES = ["author", "translator", "editor"]

  belongs_to :book
  belongs_to :contributor

  validates :book, :contributor, :role, presence: true
  validates :role, inclusion: { in: Contribution::ROLES , message: "must be included in Contribution::ROLES" }
  validate :unique_combination_of_book_contributor_and_role

  private

  def unique_combination_of_book_contributor_and_role
    identical_contributions = Contribution.where(book: book, contributor: contributor, role: role)
    errors.add(:contributor, "this contribution already exists") if identical_contributions.count.positive?
  end
end
