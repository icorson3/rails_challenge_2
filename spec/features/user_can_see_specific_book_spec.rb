require 'rails_helper'

describe 'as a user' do
  describe 'when im on the book show page' do
    scenario 'then i see book name, review body and usser that created review and ratings' do
      book = Book.create!(title: "Age of Ultron")
      user = User.create!(name: "tony Stark")
      review = book.reviews.create!(body: "this books sucked", rating: 2, user: user)

      visit book_path(book)

      expect(page).to have_content("Age of Ultron")
      expect(page).to have_content("this books sucked")
      expect(page).to have_content(2)
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
