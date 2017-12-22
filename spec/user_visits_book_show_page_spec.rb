require 'rails_helper'

describe "a user visits the show page for a book" do
  it "they see the title of the book" do
    user = User.create(name: "Nico")
    book = Book.create(title: "Harry Potter")
    review = Review.create(book_id: book.id, rating: 5, body: "Good if you like spells", user_id: user.id)

    visit book_path(book)

    expect(page).to have_content("Harry Potter")
  end
  xit "sees the review of the book and the rating" do
    user = User.create(name: "Nico")
    book = Book.create(title: "Harry Potter")
    review = Review.create(book_id: book.id, rating: 5, body: "Good if you like spells", user_id: user.id)
   
    visit book_path(book)

    expect(page).to have_content("Good if you like spells")
    expect(page).to have_content(4)
    expect(page).to have_content("Nico")
  end
end

xdescribe "when the user visit the page" do
  it "sees the average rating of the book" do
    user = User.create(name: "Nico")
    book = Book.create(title: "Harry Potter")
    review = Review.create(book_id: book.id, rating: 5, body: "Good if you like spells", user_id: user.id)
    review = Review.create(book_id: book.id, rating: 3, body: "Would have prefered more potions", user_id: user.id)
    
    visit book_path(book)

    expect(page).to have_content(4)
    expect(page).to have_content(5)
    expect(page).to have_content(3)
  end
end