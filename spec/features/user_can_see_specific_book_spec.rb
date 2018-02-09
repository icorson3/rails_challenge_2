require 'rails_helper'

describe 'as a user i can see a specific book and all reviews for it' do
  describe 'when i am on the book show path' do
    scenario 'then i can see book title, reviews' do
      book = Book.create!(title: "The Jungle Book")
      user = User.create!(name: "Bob Ross")
      review = user.reviews.create!(body: "Made me feel warm and fuzzy", rating: 5, book: book)
      visit book_path(book)

      expect(page).to have_content("The Jungle Book")
    end
  end
end


# When I visit a book show page,
# I see the book title
#  and a list of reviews for that book,
#  including the body and the user that created that review.
#   I also see the rating (1-5;
#   you do not need to validate that this falls within this range)
#     that the user gave the book.
