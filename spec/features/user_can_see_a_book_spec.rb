require 'rails_helper'

# When I visit a book show page, I see the book title and a list of reviews for that book,
# including the body and the user that created that review.
# I also see the rating (1-5; you do not need to validate that this falls within this range)
# that the user gave the book.

describe "user can see individual book information" do
  context "visits book show page" do
    it "displays book informations" do
      book = Book.create!(title: "Catcher in the Rye")

      visit book_path(book)

      expect(page).to have_content("Title: Catcher in the Rye")
    end

    it "displays book reviews" do
      book = Book.create!(title: "Catcher in the Rye")
      review_1 = book.reviews.create!(user_name: "Billy",
                                      body: "I enjoyed this one!",
                                      rating: 5)

      visit book_path(book)

      expect(page).to have_content("Billy")
      expect(page).to have_content("I enjoyed this one!")
      expect(page).to have_content(5)
    end

    it "displays average rating of book" do
      book = Book.create!(title: "Catcher in the Rye")
      review_1 = book.reviews.create!(user_name: "Billy",
                                      body: "I enjoyed this one!",
                                      rating: 5)
      review_2 = book.reviews.create!(user_name: "molly",
                                      body: "I did not enjoy this one!",
                                      rating: 1)

      visit book_path(book)

      expect(page).to have_content("Average Rating: 3")
    end
  end
end
