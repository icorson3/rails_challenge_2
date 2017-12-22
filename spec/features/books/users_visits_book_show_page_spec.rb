require "rails_helper"

describe "When the User navigates to the book show page" do
  it "the User can see the show page" do
    book = Book.create(title: "The BFG")
    user = User.create(name: "Young")
    review = user.reviews.create(rating: 2, book_id: book.id)

    visit book_path(book)

    expect(page).to have_content("The BFG")
    expect(page).to have_content()

  end


end
