require 'rails_helper'

describe "User can visit a show page" do
  scenario "user can see a show page for book" do
    book = Book.create(title: "Big")
    user = User.create(name: "Dee")
    book.reviews.create(body: "Great Book!", user: user)
    visit book_path(book)
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.reviews.last.body)
    expect(page).to have_content(book.reviews.last.user.name)
    expect(page).to have_content(book.reviews.last.rating)
  end
end
