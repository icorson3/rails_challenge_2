require 'rails_helper'

describe "user can see single book" do
  describe "from book show page" do
    it "sees single book" do
      book = create(:book)
      user = create(:user)
      review = create(:review, user: user, book: book)
      visit book_path(book)

      save_and_open_page

      expect(page).to have_content(book.title)
      expect(page).to have_content(user.name)
      expect(page).to have_content(review.rating)
    end
  end
end
