require 'rails_helper'

describe "As a user" do
  context "when I go to the books show page" do
    it "I can see the books average rating" do
      book = Book.create!(title: "Infinite Jest")
      rating = Rating.create!(rating: 4, book_id: book.id)
      rating = Rating.create!(rating: 5, book_id: book.id)

      user = User.create!(name: "Jim")

      visit book_path(book)

      expect(page).to have_content("Average Rating: 4")
    end

    it "I can see the highest rating for the book" do
    book = Book.create!(title: "Infinite Jest")
    rating = Rating.create!(rating: 4, book_id: book.id)
    rating = Rating.create!(rating: 5, book_id: book.id)
    user = User.create!(name: "Jim")

    visit book_path(book)

    expect(page).to have_content("Highest Rating: 5")
  end

    it "I can see the lowest rating for the book" do
    book = Book.create!(title: "Infinite Jest")
    rating = Rating.create!(rating: 4, book_id: book.id)
    rating = Rating.create!(rating: 5, book_id: book.id)
    user = User.create!(name: "Jim")

    visit book_path(book)

    expect(page).to have_content("Lowest Rating: 4")
  end
  end
    context "under the header for highest rating" do
      it "I can see the body of that review and the name of the reviewer that submitted the review" do
        book = Book.create!(title: "Infinite Jest")
        user = User.create!(name: "Jim")
        user2 = User.create!(name: "Jill")
        rating = Rating.create!(rating: 4, book_id: book.id, body: "Book was crazy hard to read", user_id: user.id)
        rating = Rating.create!(rating: 5, book_id: book.id, body: "Read it in one day", user_id: user2.id)

        visit book_path(book)

        expect(page).to have_content("Read it in one day")
      end
    end
end
