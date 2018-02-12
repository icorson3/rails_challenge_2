require 'rails_helper'

describe 'as a user' do
  describe 'when i ma on the show page' do
    scenario 'i see the lowest rating in a header' do
      book = Book.create!(title: "Age of Ultron")
      user = User.create!(name: "tony Stark")
      review = book.reviews.create!(body: "this books sucked", rating: 2, user: user)
      user_2 = User.create!(name: "steve rodgers")
      review_2 = book.reviews.create!(body: "awesome book", rating: 5, user: user_2)
      user_3 = User.create!(name: "the hulk")
      review_3 = book.reviews.create!(body: "arrrggg", rating: 1, user: user_3)

      visit book_path(book)

      expect(page).to have_content("Lowest rating: 1")
      expect(page).to have_content("Lowest rated review user's name: the hulk")
      expect(page).to have_content("Lowest rated review: arrrggg")
    end
  end
end