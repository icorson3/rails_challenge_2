require 'rails_helper'

describe Book do
  describe "Associations" do
    it "has many reviews" do
      book = Book.new(title: "Book1")
      expect(book).to respond_to(:reviews)
    end
  end

  describe "Instance Methods" do

    before :each do
      @book = Book.create(title: "Book1")
      @book.reviews.create(username: "grayton", body: "i really liked this book", rating: 5)
      @book.reviews.create(username: "grayton2", body: "ibook", rating: 3)
      @book.reviews.create(username: "grayton3", body: "i", rating: 1)
    end

    describe "#average_rating" do
      it "calculates the average rating for all reviews for a book" do
        expect(@book.average_rating).to eq(3)
      end
    end

    describe "#max_rating" do
      it "finds the highest rating score" do
        expect(@book.max_rating).to eq(5)
      end
    end

    describe "#lowest_rating" do
      it "finds the lowest rating score" do
        expect(@book.lowest_rating).to eq(1)
      end
    end

    describe "#best_review" do
      it "finds the review with the highest rating score" do
        review = @book.best_review
        expect(review.username).to eq("grayton")
        expect(review.body).to eq("i really liked this book")
      end
    end

    describe "#worst_review" do
      it "finds the review with the lowest rating score" do
        review = @book.worst_review
        expect(review.username).to eq("grayton3")
        expect(review.body).to eq("i")
      end
    end

  end
end
