require 'rails_helper'

RSpec.describe Shelf, type: :model do
  describe '#contents' do
    let(:shelf) { build(:shelf) }

    it "returns all the placements for a given shelf"


    context "when shelf empty" do
      it "returns empty" do
        ans = shelf.contents
        expect(ans).to be_empty
      end
    end

  end
end
