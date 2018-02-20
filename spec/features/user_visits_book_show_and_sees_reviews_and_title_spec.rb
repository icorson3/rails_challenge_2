require 'rails_helper'
  describe "user visits book show page"  do
    it "user sees book title and reviews"  do
    book = Book.create!(title: "Harry Potter")
    user = User.create!(name: "Kyle")
    review = book.reviews.create!(body: "awesome",rating: 10, user_id: user.id, book_id: book.id)

    visit book_path(review)

    expect(page).to have_content(book.title)
    expect(page).to have_content(review.body)
    expect(page).to have_content(review.rating)
  end
end
  describe "user sees the avergae review of book"  do
    it "when they visit book show page"  do
      book = Book.create!(title: "Harry Potter")
      user = User.create!(name: "Kyle")
      review = book.reviews.create!(body: "awesome",rating: 10, user_id: user.id, book_id: book.id)
      review = book.reviews.create!(body: "something",rating: 10, user_id: user.id, book_id: book.id)

      expect(page).to have_content(10)
    end
  end 
