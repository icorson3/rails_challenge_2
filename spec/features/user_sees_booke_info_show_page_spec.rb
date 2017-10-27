require 'rails_helper'

RSpec.feature "when a user visits the book show page" do
  let!(:book) { Book.create(title: 'cool')}
  let!(:user) { User.create }

  before { visit book_path(book) }

  scenario "i see the book title and a list of reviews" do
    expect(page).to have_content("#{book.title}")


  end
end
