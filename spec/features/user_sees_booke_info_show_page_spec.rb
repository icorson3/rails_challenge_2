require 'rails_helper'

RSpec.feature "when a user visits the book show page" do
  let!(:book) { Book.create(title: 'cool')}
  let!(:user) { User.create(name: 'big book guy') }
  let!(:review) { book.reviews.create(body: 'super chill book', user: user)}
  before { visit book_path(book) }

  scenario "I see the book title and a list of reviews" do
    # review = book.reviews.create(body: 'super chill book', user: user)

    expect(page).to have_content(book.title)
    expect(page).to have_content("ALL THESE REVIEWS")
    expect(page).to have_content(user.name)
    expect(page).to have_content(review.body)
  end
end
