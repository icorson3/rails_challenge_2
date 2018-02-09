require 'rails_helper'

describe "user sees book information" do
  describe "user visits book_path" do
    it "they can see the book details" do
      book = Book.create!(title: "Harry Potter")
      user_1 = User.create!(name: "Severus Snape")
      user_2 = User.create!(name: "Ron Weasley")
      review_1 = Review.create!(book: book, user: user_1, body: "Excellent character development.", rating: 4)
      review_2 = Review.create!(book: book, user: user_2, body: "Superb romance.", rating: 3)

      visit book_path(book)

      expect(page).to have_content("Harry Potter")
      expect(page).to have_content("Severus Snape")
      expect(page).to have_content("Excellent character development.")
      expect(page).to have_content(4)
      expect(page).to have_content("Ron Weasley")
      expect(page).to have_content("Superb romance.")
      expect(page).to have_content(3)
    end

    it "they can see the book's average rating" do
      book = Book.create!(title: "Harry Potter")
      user_1 = User.create!(name: "Severus Snape")
      user_2 = User.create!(name: "Ron Weasley")
      review_1 = Review.create!(book: book, user: user_1, body: "Excellent character development.", rating: 4)
      review_2 = Review.create!(book: book, user: user_2, body: "Superb romance.", rating: 3)

      visit book_path(book)

      expect(page).to have_content("Average Rating: 3.5")
    end

    it "they can see the book's highest rating" do
      book = Book.create!(title: "Harry Potter")
      user_1 = User.create!(name: "Severus Snape")
      user_2 = User.create!(name: "Ron Weasley")
      review_1 = Review.create!(book: book, user: user_1, body: "Excellent character development.", rating: 4)
      review_2 = Review.create!(book: book, user: user_2, body: "Superb romance.", rating: 3)

      visit book_path(book)

      within(".highest-rating")
        expect(page).to have_content("Highest Rating: 4")
        expect(page).to have_content("Excellent character development.")
    end

    it "they can see the book's highest rating" do
      book = Book.create!(title: "Harry Potter")
      user_1 = User.create!(name: "Severus Snape")
      user_2 = User.create!(name: "Ron Weasley")
      review_1 = Review.create!(book: book, user: user_1, body: "Excellent character development.", rating: 4)
      review_2 = Review.create!(book: book, user: user_2, body: "Superb romance.", rating: 3)

      visit book_path(book)

      within(".lowest-rating")
        expect(page).to have_content("Lowest Rating: 3")
        expect(page).to have_content("Superb romance")
    end
  end
end
