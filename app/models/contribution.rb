class Contribution < ApplicationRecord
  belongs_to :book
  belongs_to :contributer
end
