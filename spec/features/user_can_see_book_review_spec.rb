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
    it  'sees the user that created the review' do
      book = Book.create(title: 'Left hand of darkness')
      user = User.create(name: "Joe")
      review1 = book.reviews.create(body: "it was bad", rating: 2, user_id: user.id, book_id: book.id)
      review2 = book.reviews.create(body: "it was alright", rating: 4, user_id: user.id, book_id: book.id)
      review3 = book.reviews.create(body: "it was good", rating: 6, user_id: user.id, book_id: book.id)

      visit "/books/#{book.id}"


      expect(page).to have_content("#{user.id}")


    end

        it  'sees the user that average rating for the review' do
          book = Book.create(title: 'Left hand of darkness')
          user = User.create(name: "Joe")
          review1 = book.reviews.create(body: "it was bad", rating: 1, user_id: user.id, book_id: book.id)
          review2 = book.reviews.create(body: "it was real bad", rating: 2, user_id: user.id, book_id: book.id)
          review3 = book.reviews.create(body: "it was not good", rating: 3, user_id: user.id, book_id: book.id)

          visit "/books/#{book.id}"

          expect(page).to have_content(2)
        end

          it  'sees the user that highest rating for the review' do
            book = Book.create(title: 'Left hand of darkness')
            user = User.create(name: "Joe")
            review1 = book.reviews.create(body: "it was bad", rating: 1, user_id: user.id, book_id: book.id)
            review2 = book.reviews.create(body: "it was real bad", rating: 2, user_id: user.id, book_id: book.id)
            review3 = book.reviews.create(body: "it was not good", rating: 5, user_id: user.id, book_id: book.id)

            visit "/books/#{book.id}"

            expect(page).to have_content("Highest Rating: 5")
          end

          it  'sees the user that lowest rating for the review' do
            book = Book.create(title: 'Left hand of darkness')
            user = User.create(name: "Joe")
            review1 = book.reviews.create(body: "it was bad", rating: 1, user_id: user.id, book_id: book.id)
            review2 = book.reviews.create(body: "it was real bad", rating: 2, user_id: user.id, book_id: book.id)
            review3 = book.reviews.create(body: "it was not good", rating: 5, user_id: user.id, book_id: book.id)

            visit "/books/#{book.id}"

            expect(page).to have_content("Lowest Rating: 1")
          end

          # it  'sees the user that review that has the highest ' do
          #   book = Book.create(title: 'Left hand of darkness')
          #   user = User.create(name: "Joe")
          #   review1 = book.reviews.create(body: "it was bad", rating: 1, user_id: user.id, book_id: book.id)
          #   review2 = book.reviews.create(body: "it was real bad", rating: 2, user_id: user.id, book_id: book.id)
          #   review3 = book.reviews.create(body: "it was really quite good", rating: 5, user_id: user.id, book_id: book.id)
          #
          #   visit "/books/#{book.id}"
          #
          #   expect(page).to have_content("it was really quite good")
          # end
  end
end






# , including the body and the user that created that review. I also see the rating (1-5; you do not need to validate that this falls within this range) that the user gave the book.
