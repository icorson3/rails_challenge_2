require 'rails_helper'

RSpec.feature "when a user visits the book show page" do
  let!(:book) { Book.create(title: 'cool')}
  let!(:user) { User.create(name: 'big book guy') }
  let!(:review) { book.reviews.create(body: 'super chill book', rating: 1, user: user)}
  let!(:review_2) { book.reviews.create(body: 'kinda chill', rating: 3, user: user)}
  let!(:review_3) { book.reviews.create(body: 'barbaric', rating: 1, user: user)}
  let!(:review_4) { book.reviews.create(body: 'post post noir', rating: 4, user: user)}
  before { visit book_path(book) }

  scenario "I see the book title and a list of reviews" do
    expect(page).to have_content(book.title)
    expect(page).to have_content("ALL THESE REVIEWS")
    expect(page).to have_content(user.name)
    expect(page).to have_content(review.body)
  end

  scenario "I see the book's rating" do
    expect(page).to have_content(review.rating)
  end

  scenario "I see a books average rating" do
    expect(page).to have_content('Average Rating: 2.25')
  end

  scenario "I see a books maximum rating" do
    expect(page).to have_content('Maximum Rating: 4')
  end

  scenario "I see a books minimum rating" do
    expect(page).to have_content('Minimum Rating: 1')
  end
end
