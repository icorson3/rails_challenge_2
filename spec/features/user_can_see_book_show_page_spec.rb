require 'rails_helper'

describe "When a visitor visits a Book show page" do
  it "sees the book's title, list of reviews, and the user for each review" do
    book = Book.create(title: "Eaarth")
    review1 = Review.create(body: "Good book", rating: 5, user: user1)
    review2 = Review.create(body: "Ok book", rating: 3, user: user1)
    user1 = User.create(name: "Lee")
    book.users << user
    book.reviews << review1
    book.reviews << review2

    visit book_path(book)

    expect(page).to have_content book.title
    expect(page).to have_content user.name
    expect(page).to have_content user.name


  end
end
