require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "Class Methods" do
    before(:each) do

      book = Book.create(title: "Infinite Jest")
      u1 = User.create(name: "Matt")
      u2 = User.create(name: "Tolstoy")
      r1 = Review.create(body: "A stellar read!", user_id: u1.id, book_id: book.id, rating: 5)
      r2 = Review.create(body: "Post-modern garbage!", user_id: u2.id, book_id: book.id, rating: 1)
    end

    describe "#average_rating" do
      it "should return an average rating" do
        expect(Review.average_rating).to eq(3)
      end
    end

    describe "#by_rating" do
      it "returns and array of ordered reviews" do
        expect(Review.by_rating.first.rating).to eq(1)
      end
    end
  end

  describe "relationships" do
    it { is_expected.to belong_to(:user)}
    it { is_expected.to belong_to(:book)}
  end
end
