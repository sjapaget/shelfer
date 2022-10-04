require 'rails_helper'

RSpec.describe Shelf, type: :model do
  describe "#name" do
    it 'validates presence' do
      shelf = Shelf.new
      shelf.validate
      expect(shelf.errors[:name]).to include("can't be blank")

      shelf.name = "Cats"
      shelf.validate
      expect(shelf.errors[:name]).to_not include("can't be blank")
    end
  end

  describe "#description" do
    it 'validates presence' do
      shelf = Shelf.new
      shelf.validate
      expect(shelf.errors[:description]).to include("can't be blank")

      shelf.description = "All the books on cats in this shelf"
      shelf.validate
      expect(shelf.errors[:description]).to_not include("can't be blank")
    end
  end
end
