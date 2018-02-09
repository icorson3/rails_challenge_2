require "rails_helper"

describe "As a User" do
  before :each do
    @user = User.create!(name: "Eupanifahorious")
    @book = Book.create!(title: "Opakawagalaga")
    @review =Review.create(title: "Box of Secrets", body: "Da wey", book: @book, user: @user, rating: 5)
  end
  describe "when I visit the books/:id page" do
    it "I can see the book title" do
      visit book_path(@book)

      expect(page).to have_content(@book.title)
    end

    it "I can see the reviews associated with that book" do
      visit book_path(@book)

      expect(page).to have_content(@review.title)
      expect(page).to have_content(@review.body)
      expect(page).to have_content(@review.user.name)
      expect(page).to have_content(@review.rating)
    end

  end
end
