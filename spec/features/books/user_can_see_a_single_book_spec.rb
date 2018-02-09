require "rails_helper"

describe "As a User" do
  before :each do
    @user = User.create!(name: "Eupanifahorious")
    @book = Book.create!(title: "Opakawagalaga")
    @review = Review.create(title: "Box of Secrets", body: "Da wey", book: @book, user: @user, rating: 5)
  end
  describe "when I visit the books/:id page" do
    it "I can see the book title" do
      visit book_path(@book)

      expect(page).to have_content(@book.title)
    end

    it "I can see the reviews associated with the book" do
      visit book_path(@book)

      expect(page).to have_content(@review.title)
      expect(page).to have_content(@review.body)
      expect(page).to have_content(@review.user.name)
      expect(page).to have_content(@review.rating)
    end

    it "I can see the average rating for the book" do
      Review.create(title: "Box of Stupids", body: "Da bad wey", book: @book, user: @user, rating: 3)

      visit book_path(@book)

      expect(page).to have_content("Average Rating: 4")
    end

    it "I can see the highest rating for the book" do
      Review.create(title: "Box of Stupids", body: "Da bad wey", book: @book, user: @user, rating: 3)

      visit book_path(@book)

      expect(page).to have_content("Highest Rating: 4")
    end

    it "I can see the lowest rating for the book" do
      Review.create(title: "Box of Stupids", body: "Da bad wey", book: @book, user: @user, rating: 3)

      visit book_path(@book)

      expect(page).to have_content("Lowest Rating: 4")
    end

  end
end
