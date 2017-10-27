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
      @book.reviews.create(username: "grayton", body: "i really liked this book", rating: 4)
      @book.reviews.create(username: "grayton2", body: "ibook", rating: 1)
      @book.reviews.create(username: "grayton3", body: "i", rating: 1)
    end

    describe "#average_rating" do
      it "calculates the average rating for all reviews for a book" do
        expect(@book.average_rating).to eq(2)
      end
    end

    describe "#max_rating" do
      it "finds the highest rating score" do
        expect(@book.max_rating).to eq(4)
      end
    end
  end
end
