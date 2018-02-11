require 'rails_helper'

describe "user can see one book and list of reviews for that book, including body of review, user and rating" do
  context "user links to book show page" do
    scenario "user sees book info, reviews, users and ratings" do
      book = Book.create(title: "Little Women")
      user_1 = User.create(name: "Ellen")
      user_2 = User.create(name: "Trevor")
      review_1 = Review.create(body: "This book is a classic.", rating: 4, book_id: book.id, user_id: user_1.id)
      review_2 = Review.create(body: "This book is a bore.", rating: 1, book_id: book.id, user_id: user_2.id)

      visit book_path(book)

      expect(page).to have_content(book.title)
      expect(page).to have_content(user_1.name)
      expect(page).to have_content(user_2.name)
      expect(page).to have_content(review_1.body)
      expect(page).to have_content(review_1.rating)
      expect(page).to have_content(review_2.body)
      expect(page).to have_content(review_2.rating)
      expect(page).to have_content("highest rating: 4")
      expect(page).to have_content("lowest rating: 1")
      expect(page).to have_content("highest rating Review: This book is a classic.")
      expect(page).to have_content("highest rating User: Ellen")
      expect(page).to have_content("lowest rating Review: This book is a bore.")
      expect(page).to have_content("lowest rating User: Trevor")
    end
  end
end
