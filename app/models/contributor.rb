class Contributor < ApplicationRecord
  belongs_to :user
  has_many :contributions, dependent: :destroy

  validates :name, :user, presence: true
  validates :name, uniqueness: true

  def role(book)
    contributions = book.contributions.where(contributor: self)
    contributions.map(&:role)
  end
end
