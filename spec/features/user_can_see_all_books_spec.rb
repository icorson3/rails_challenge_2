require 'rails_helper'

describe "User logs in" do
  scenario "sees books" do
    user = User.create(name: "Sally")
    book = Book.create(title: "Harry Potter")

    visit book_path(book)

    expect(page).to have_content("Welcome, #{user.name}")
    expect(page).to have_content("Harry Potter")
  end
end


# When I visit a book show page, I see the book title and a list of reviews for that book, including the body and the user that created that review. I also see the rating (1-5; you do not need to validate that this falls within this range) that the user gave the book.

# When I visit the book show page, I see the average rating for that book.

# When I visit the book show page, I see a header that includes the highest rating for that book (e.g "Highest Rating: 4").

# When I visit the book show page, I see a header that includes the lowest rating for that book (e.g "Lowest Rating: 1").

# When I visit the book show page, under the header for highest rating, I see the body of that review and the name of the reviewer that submitted that review.

# When I visit the book show page, under the header for lowest rating, I see the body of that review and the name of the reviewer that submitted that review.
