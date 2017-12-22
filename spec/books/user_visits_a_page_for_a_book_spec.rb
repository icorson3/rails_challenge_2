require 'rails_helper'

describe "a user visits a book show page" do
  context "the book has been given ratings" do
    it "the user sees the average rating for that book" do
      book = Book.create(title: "Old Man and the Sea")
      user = User.create(name: "John")
      user1 = User.create(name: "Hank")
      user2 = User.create(name: "Holly")
      review = Review.create(rating: 5,
                          body: "A Charming Tale",
                          book: book,
                          user: user)
      review = Review.create(rating: 3,
                          body: "A Charmingish Tale",
                          book: book,
                          user: user1)
      review = Review.create(rating: 3,
                          body: "What is this book about again?",
                          book: book,
                          user: user2)

      visit "/books/1"

      expect(page).to have_content("Average Rating: 4")
    end
  end
end
