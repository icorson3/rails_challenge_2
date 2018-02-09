require "rails_helper"

describe "As a User" do
  before :each do
    @book = Book.create!(title: "Opakawagalaga")
    @user = User.create!(name: "Eupanifahorious")
  end
  describe "when I visit the books/:id page" do
    it "I can see the book title" do
      visit book_path(@book)

      expect(page).to have_content(@book.title)
    end

  end
end
