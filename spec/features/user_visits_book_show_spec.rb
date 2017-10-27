require "rails_helper"

describe "User visits the show page for a book," do

  it "they see the book title, all reviews (with the user, body and rating per review)" do

    book = Book.create(title:"Alice in Wonderland")
    user_1 = User.create(name: "Jane")
    user_2 = User.create(name: "Mary")
    user_3 = User.create(name: "Bob")
    review_1 = Review.create(rating: 5, body:"I love this book!", users_id: user_1.id)
    review_2 = Review.create(rating: 3, body:"This book is kind weird!", users_id: user_2.id)
    review_3 = Review.create(rating: 1, body:"This book is old", users_id: user_3.id)

    visit book_path(book)

    expect(page).to have_content(book.title)
    expect(page).to have_content(review_1.users.name)
    expect(page).to have_content(review_3.users.name)
    expect(page).to have_content(review_1.rating)
    expect(page).to have_content(review_1.body)
    expect(page).to have_content(review_3.rating)
    expect(page).to have_content(review_3.body)



  end
end
