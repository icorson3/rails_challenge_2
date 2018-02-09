require 'rails_helper'

describe "As a user" do
  context "when I go to the books show page" do
    it "I can see the books average rating" do
      rating = Rating.create!(rating: 5)
      book = Book.create!(title: "Infinite Jest", rating_id: rating.id)
      user = User.create!(name: "Jim")

      visit book_path(book)

      expect(page).to have_content("Average Rating")
    end
  end
end
