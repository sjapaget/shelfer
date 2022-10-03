class Contributor < ApplicationRecord
  belongs_to :user

  validates :name, :user, presence: true
  validates :name, uniqueness: true
end
