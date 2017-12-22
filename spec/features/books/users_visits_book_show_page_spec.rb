require "rails_helper"

describe "When the User navigates to the book show page" do
  it "the User can see the show page" do
    book = Book.create(title: "The BFG")
    book2 = Book.create(title: "The Witches")

    user = User.create(name: "Young")
    user2 = User.create(name: "Gary")
    user3 = User.create("Shirley")

    user.reviews.create(rating: 5, body: "Great book!", book_id: book.id)
    user2.reviews.create(rating: 3, body: "Liked it!", book_id: book.id)
    user3.reviews.create(rating: 4, body: "It was good.", book_id: book.id)
    user2.reviews.create(rating: 1, body: "Hated it!", book_id: book2.id)


    visit book_path(book)

    expect(page).to have_content("The BFG")
    expect(page).to have_content("Great book!")
    expect(page).to have_content("Young")
    expect(page).to have_content(5)
    expect(page).to have_content(4)
    expect(page).to have_content(3)

  end


end
