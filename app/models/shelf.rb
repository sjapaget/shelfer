class Shelf < ApplicationRecord
  belongs_to :user
  has_many :placements, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  def titles
     titles = placements.map { |placement| placement.book.title }
     titles.empty? ? 'Shelf empty' : titles
  end

  
end
