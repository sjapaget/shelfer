require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "#content" do
    it 'validates presence' do
      review = Review.new
      review.validate
      expect(review.errors[:content]).to include("can't be blank")

      review.content = "a great book"
      review.validate
      expect(review.errors[:content]).to_not include("can't be blank")
    end
  end

  describe "#rating" do
    it 'validates presence' do
      review = Review.new
      review.validate
      expect(review.errors[:rating]).to include("can't be blank")

      review.rating = "4"
      review.validate
      expect(review.errors[:rating]).to_not include("can't be blank")
    end
  end
end
