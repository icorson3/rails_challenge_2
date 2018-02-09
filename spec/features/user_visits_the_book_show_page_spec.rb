require 'rails_helper'

describe "User visits the book show page" do
  describe "when a visitor visits the user show page" do
    scenario "the see the book title and reviews" do
      User.create!(name: "Mike")
      book = Book.create!(title: "Avatar")
      visit book_path(book)

      save_and_open_page
      expect(page).to have_content("Avatar")

    
    end
  end
end
