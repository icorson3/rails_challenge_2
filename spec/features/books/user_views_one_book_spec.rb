require 'rails_helper'

describe "user can see one book and list of reviews for that book, including body of review, user and rating" do
  context "user links to book show page" do
    scenario "user sees book info, reviews, users and ratings" do
      book = Book.create(title: "Little Women")
      user = User.create(name: "Ellen")
      review = Review.create(body: "This book is a classic.", rating: 4, book_id: book.id, user: user.id)

      visit book_path(book)

      expect(page).to have_content(book.title)
      expect(page).to have_content(user.name)
      expect(page).to have_content(review.body)
      expect(page).to have_content(review.rating)
    end
  end
end 
