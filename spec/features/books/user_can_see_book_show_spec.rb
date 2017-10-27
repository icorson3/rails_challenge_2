require 'rails_helper'

feature 'When a User visits book show page' do
  before do
    @book = Book.create(title: "A Tale of Two Cities" )
    @user = User.create(name: "John Doe")
    @review = @user.reviews.create(body: "Classic!", rating: 4, user_id: @user, book_id: @book )
    @user2 = User.create(name: "Jane Doe")
    @review2 = @user.reviews.create(body: "Terrible!", rating: 1, user_id: @user2, book_id: @book )
    @user3 = User.create(name: "Jack Doe")
    @review3 = @user.reviews.create(body: "It was ok!.", rating: 3, user_id: @user3, book_id: @book )
    visit book_path(@book)
  end
  describe 'the User can see the book title' do
    expect(page).to have_content("A Tale of Two Cities")
  end
  describe ''
end






When I visit a book show page, I see the book title and a list of reviews for that book, including the body and the user that created that review. I also see the rating (1-5; you do not need to validate that this falls within this range) that the user gave the book.

When I visit the book show page, I see the average rating for that book.

When I visit the book show page, I see a header that includes the highest rating for that book (e.g "Highest Rating: 4").

When I visit the book show page, I see a header that includes the lowest rating for that book (e.g "Lowest Rating: 1").

When I visit the book show page, under the header for highest rating, I see the body of that review and the name of the reviewer that submitted that review.

When I visit the book show page, under the header for lowest rating, I see the body of that review and the name of the reviewer that submitted that review.
