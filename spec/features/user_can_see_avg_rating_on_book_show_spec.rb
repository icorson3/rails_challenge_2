require 'rails_helper'

describe "As a user" do
  context "when I go to the books show page" do
    it "I can see the books average rating" do
      book = Book.create!(title: "Infinite Jest")
      user = User.create!(name: "Jim")
      rating = Rating.create!(rating: 5, user: user)

      visit books_path(book)

      expect(page).to have_content("Average Rating")
    end
  end
end
