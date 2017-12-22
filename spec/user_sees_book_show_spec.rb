require 'rails_helper'

describe "a user visits the book show page" do
        it "user visits the book show page" do
          book = Book.new(title: "LOTR")
          user1 = User.new(name: "Tyler")
          user2 = User.new(name: "James")
          review1 = Review.new(book_id: book.id, user_id: user1.id, body: "Awesome Book", rating: 4)
          review2 = Review.new(book_id: book.id, user_id: user2.id, body: "Was Ok", rating: 2)

          visit "/books/#{book.id}"

          expect(current_path).to eq("/books/#{book.id}")

          expect(page).to have_content("#{book.title}")
          expect(page).to have_content("#{user1.name}")
          expect(page).to have_content("#{review1.body}")
          expect(page).to have_content("#{review1.rating}")
          expect(page).to have_content("3")
          expect(page).to have_content("#{review2.rating}")
          expect(page).to have_content("#{review2.body}")
  end
end
