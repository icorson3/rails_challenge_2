require 'rails_helper'

describe 'book reviews' do
  context 'When a user visit a book show page' do
    it  'see the book title and a list of reviews for that book' do
      book = Book.create(title: 'Left hand of darkness')
      user = User.create(name: "Joe")
      review = book.reviews.create(body: "it was good", rating: 4, user_id: user.id, book_id: book.id)

      visit "/books/#{book.id}"

      expect(page).to have_content("Left hand of darkness")
      expect(page).to have_content("it was good")
      expect(page).to have_content(4)


    end

    #
    # it  'see the user that created the review' do
    #   book = Book.create(title: 'Left hand of darkness')
    #   user = User.create(name: "Joe")
    #   review = book.reviews.create(body: "it was good", rating: 4, user_id: user.id, book_id: book.id)
    #
    #   visit "/books/#{book.id}"
    #
    #   expect(page).to have_content("Left hand of darkness")
    #   expect(page).to have_content("it was good")
    #   expect(page).to have_content(4)
    #
    #
    # end
  end
end






# , including the body and the user that created that review. I also see the rating (1-5; you do not need to validate that this falls within this range) that the user gave the book.
