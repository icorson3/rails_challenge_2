require 'rails_helper'

describe 'as a user' do
  describe 'when i am on book show page' do
    scenario 'i see an average rating for the that book' do
      book = Book.create!(title: "Age of Ultron")
      user = User.create!(name: "tony Stark")
      review = book.reviews.create!(body: "this books sucked", rating: 2, user: user)
      user_2 = User.create!(name: "steve rodgers")
      review_2 = book.reviews.create!(body: "awesome book", rating: 5, user: user_2)

      visit book_path(book)

      expect(page).to have_content("Average rating: 3")
    end
  end
end



# When I visit the book show page,
#  I see the average rating for that book.