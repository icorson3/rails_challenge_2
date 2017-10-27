require 'rails_helper'

describe "When a user visits a book show page" do
  scenario "I see the book title and reivews" do
    book = Book.create(title: "Book1")
    book.reviews.create(username: "grayton", body: "i really liked this book", rating: 5)
    book.reviews.create(username: "grayton2", body: "ibook", rating: 3)
    book.reviews.create(username: "grayton3", body: "i", rating: 1)
    visit book_path(book)

    expect(page).to have_content("Book1")

    within(".reviews") do
      expect(page).to have_content "Username: grayton"
      expect(page).to have_content "Review: i really liked this book"
      expect(page).to have_content "Rating: 5"
    end

    expect(page).to have_content "Average Rating: 3"

    expect(page).to have_content "Highest Rating: 5"

    within ".highest-rating" do
      expect(page).to have_content "Review: i really liked this book"
      expect(page).to have_content "Username: grayton"
    end

    expect(page).to have_content "Lowest Rating: 1"

    within ".lowest-rating" do
      expect(page).to have_content "Review: i"
      expect(page).to have_content "Username: grayton3"
    end
  end
end
