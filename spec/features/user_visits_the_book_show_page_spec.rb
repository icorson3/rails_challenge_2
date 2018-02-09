require 'rails_helper'

describe "User visits the book show page" do
  describe "when a visitor visits the user show page" do
    it "the see the book title and reviews" do
      book = Book.create!(title: "Avatar")
      visit book_path(book)

      expect(page).to have_content("Avatar")
    
    end
  end
end
