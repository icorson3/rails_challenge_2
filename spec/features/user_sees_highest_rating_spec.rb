require 'rails_helper'

describe 'as a user' do
  describe 'when im on the show page' do
    scenario 'i see the highest rating ' do
      book = Book.create!(title: "Age of Ultron")
      user = User.create!(name: "tony Stark")
      review = book.reviews.create!(body: "this books sucked", rating: 2, user: user)
      user_2 = User.create!(name: "steve rodgers")
      review_2 = book.reviews.create!(body: "awesome book", rating: 5, user: user_2)
      user_3 = User.create!(name: "the hulk")
      review_3 = book.reviews.create!(body: "arrrggg", rating: 1, user: user_3)

      visit book_path(book)

      expect(page).to have_content("Highest rating: 5")
      expect(page).to have_content("Highest rated review user's name: steve rodgers")
      expect(page).to have_content("Highest rated review: awesome book")

    end


  end
end



# When I visit the book show page,
#  I see a header that includes the highest rating for that book (e.g "Highest Rating: 4").

# When I visit the book show page,
#  under the header for highest rating,
#   I see the body of that review and the name of the reviewer that submitted that review.