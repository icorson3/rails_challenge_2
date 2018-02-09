require "rails_helper"

describe "As a user" do
  describe "when I visit a book page" do
    it "he or she sees the books reviews and content" do
      book = Book.create(title: "Infinite Jest")
      u1 = User.create(name: "Matt")
      u2 = User.create(name: "Tolstoy")
      r1 = Review.create(body: "A stellar read!", user_id: u1.id, book_id: book.id, rating: 5)
      r2 = Review.create(body: "Post-modern garbage!", user_id: u2.id, book_id: book.id, rating: 1)

      visit book_path(book)

      save_and_open_page


      expect(page).to have_content("Infinite Jest")
      expect(page).to have_content("Matt")
      expect(page).to have_content("Tolstoy")
      expect(page).to have_content("A stellar read!")
      expect(page).to have_content("Post-modern garbage!")
      expect(page).to have_content("5")
      expect(page).to have_content("1")
      expect(page).to have_content("Average rating for Infinite Jest: 3.0")
    end
  end
end
