require 'rails_helper'

describe "User vists a book show page" do


  scenario "user sees a lists of reviews for the book" do
    book = Book.create(title: "Harry Potter")
    user = User.create(name: "Emily")


    book.reviews.create(body: "This is the BEST BOOK!", user: user, rating: 5)


      visit book_path(book)

      expect(page).to have_content("This is the BEST BOOK!")
      expect(page).to have_content("Emily")
      expect(page).to have_content(5)
  end

  scenario"user sees the average rating for the book" do

    book = Book.create(title: "Harry Potter")
    user = User.create(name: "Emily")


    book.reviews.create(body: "This is the BEST BOOK!", user: user, rating: 5)
    book.reviews.create(body: "This is the ok BOOK!", user: user, rating: 4)
    book.reviews.create(body: "This is the worst BOOK!", user: user, rating: 3)


      visit book_path(book)

      expect(page).to have_content("average rating: 4")
    end


end
