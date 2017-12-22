require 'rails_helper'

describe "When a visitor visits a Book show page" do
  it "sees the book's title, list of reviews, and the user for each review" do
    book = Book.create(title: "Eaarth")
    user1 = User.create(name: "Lee")
    review1 = Review.create(body: "Good book", rating: 5, user: user1)
    review2 = Review.create(body: "Ok book", rating: 3, user: user1)
    book.users << user1
    book.reviews << review1
    book.reviews << review2

    visit book_path(book)

    expect(page).to have_content book.title
    expect(page).to have_content user1.name
    expect(page).to have_content review1.body
    expect(page).to have_content review2.body
    expect(page).to have_content review1.rating
    expect(page).to have_content review2.rating

  end
end
