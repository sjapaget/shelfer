class Contribution < ApplicationRecord
  belongs_to :book
  belongs_to :contributor

  # The list of accepted values for contribution.role
  ROLES = ["author", "translator", "editor"]
end
