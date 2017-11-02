require 'rails_helper'

describe Review do
  before :each do
    @book = Book.create(title: "Into Thin Air")
    @user1 = User.create(name: "Person")
    @user2 = User.create(name: "Different Person")
    @review1 = @book.reviews.create(body: "This book was bad.", rating: 1, user_id: @user1.id)
    @review2 = @book.reviews.create(body: "This book was good.", rating: 5, user_id: @user2.id)
  end
  describe "Class Methods" do
    it ".average_rating" do
      expect(Review.average_rating).to eq(3)
    end

    it ".higest_rating" do
      expect(Review.highest_rating).to eq(5)
    end

    it ".lowest_rating" do
      expect(Review.lowest_rating).to eq(1)
    end

    it ".higest_rated_review" do
      expect(Review.highest_rated_review).to eq(Review.last)
    end

    it ".lowest_rated_review" do
      expect(Review.lowest_rated_review).to eq(Review.first)
    end
  end
end