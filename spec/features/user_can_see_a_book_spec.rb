require 'rails_helper'

# When I visit a book show page, I see the book title and a list of reviews for that book,
# including the body and the user that created that review.
# I also see the rating (1-5; you do not need to validate that this falls within this range)
# that the user gave the book.

describe "user can see individual book information" do
  context "visits book show page" do
    it "displays book informations" do
      book = Book.create!(title: "Catcher in the Rye")
      review_1 = book.reviews.create!(user_name: "Billy",
                                      body: "I enjoyed this one!",
                                      rating: 5)

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

    it "displays highest and lowest rating of book" do
      book = Book.create!(title: "Catcher in the Rye")
      review_1 = book.reviews.create!(user_name: "Billy",
                                      body: "I enjoyed this one!",
                                      rating: 5)
      review_2 = book.reviews.create!(user_name: "Sally",
                                      body: "I'm not sure how to feel about this one!'",
                                      rating: 3)
      review_3 = book.reviews.create!(user_name: "Molly",
                                      body: "I did not enjoy this one!",
                                      rating: 1)

      visit book_path(book)

      expect(page).to have_content("Highest Rating: 5")
      expect(page).to have_content("Highest Rating Username: #{review_1.user_name}")
      expect(page).to have_content("Highest Rating Body: #{review_1.body}")
      expect(page).to have_content("Lowest Rating: 1")
      expect(page).to have_content("Lowest Rating Username: #{review_3.user_name}")
      expect(page).to have_content("Lowest Rating Body: #{review_3.body}")
    end
  end
end
