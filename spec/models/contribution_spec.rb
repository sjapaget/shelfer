require 'rails_helper'

RSpec.describe Contribution, type: :model do
  # must have a book, a contributor, and a role
  # contribution.book must be a valid instance of book
  # contribution.contributor must be a valid instance of contributor
  # role must be one of following [author, translator, ...]
  # combination of contributer, book & role must be unique
  # if its book is destroyed, a contribution should be destroyed too
  # if its contributor is destroyed, a contribution should be destroyed too

  
end
