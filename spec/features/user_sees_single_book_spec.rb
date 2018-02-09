require 'rails_helper'

describe "user can see single book" do
  describe "from book show page" do
    it "sees single book" do
      book = create(:book)
      user = create(:user)
      review = create(:review, rating: 4, user: user, book: book)
      review2 = create(:review, rating: 5, user: user, book: book)
      review3 = create(:review, rating: 3, user: user, book: book)
      visit book_path(book)

      expect(page).to have_content(book.title)
      expect(page).to have_content(user.name)
      expect(page).to have_content(review.rating)
      expect(page).to have_content(book.average_rating)
      expect(page).to have_content(book.top_rating)
    end
  end
end
