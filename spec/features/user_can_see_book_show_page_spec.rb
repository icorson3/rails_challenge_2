require "rails_helper"

describe "iser sees book show page" do
  describe "user can see show page for existing book" do
    it "shows book title and reviews" do
      user = User.create!(name: "user")
      book = Book.create!(title: "title")
      review = Review.create!(body: "body", rating: 5, user: user, book: book)

      visit book_path(book)

      expect(page).to have_content(book.title)
    end
    it "shows reviews for book" do
      user = User.create!(name: "user")
      book = Book.create!(title: "title")
      review1 = Review.create!(body: "body", rating: 5, user: user, book: book)
      review2 = Review.create!(body: "body2", rating: 4, user: user, book: book)

      visit book_path(book)

      expect(page).to have_content(book.reviews.first.body)
      expect(page).to have_content(book.reviews.second.body)
      expect(page).to have_content(book.reviews.first.rating)
      expect(page).to have_content(book.reviews.second.rating)
    end
  end
end




    # When I visit a book show page,
    # I see the book title and a list of reviews for that book,
    # including the body and the user that created that review.
    # I also see the rating (1-5; you do not need to validate that this falls within this range)
    #   that the user gave the book.
