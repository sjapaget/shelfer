class Contributor < ApplicationRecord
  belongs_to :user
  has_many :contributions, dependent: :destroy

  validates :name, :user, presence: true
end
