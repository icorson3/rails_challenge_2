require 'rails_helper'

describe Book do
  describe "relationships" do
    it "has many reviews" do
      book = Book.create(title: "Little Women")
      expect(book).to respond_to(:reviews)
    end
  end

  describe "instance methods" do
    describe "#average_rating" do
      it "returns average rating for book" do
        book = Book.create(title: "Little Women")
        user_1 = User.create(name: "Ellen")
        user_2 = User.create(name: "Trevor")
        review_1 = Review.create(body: "This book is a classic.", rating: 4, book_id: book.id, user_id: user_1.id)
        review_2 = Review.create(body: "This book is a bore.", rating: 1, book_id: book.id, user_id: user_2.id)

        expect(book.average_rating).to eq(2.5)
      end
    end
  end
end
