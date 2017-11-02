require 'rails_helper'

describe "User visits a book show page" do
  before :each do
    @book = Book.create(title: "Book")
    @user = User.create(name: "User")
    @review = @book.reviews.create(body: "This book was bad.", rating: 1, user_id: @user.id)
  end

  it "they see the books title and reviews for that book" do
    visit book_path(@book)

    expect(page).to have_content(@book.title)
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@review.body)
    expect(page).to have_content(@review.rating)
  end
end
