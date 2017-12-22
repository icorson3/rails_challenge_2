require 'rails_helper'

describe "a user visits the book show page" do
  context "a user visits the station show" do
    context "the user sees book title, reviews, & rating" do
      context "the user sees the user that created that review" do
        it "user visits the book show page" do
          book = Book.new(title: "LOTR")
          user = User.new(username: "Tyler")
          review = Review.new(book_id: book.id, user_id: user.id, body: "Awesome Book")

          visit book_path(book)

          expect(current_path).to eq("/books/#{book.id}")

          expect(page).to have_content("#{book.title}")
          expect(page).to have_content("#{user.username}")
          expect(page).to have_content("#{review.body}")

        end
      end
    end
  end
end
