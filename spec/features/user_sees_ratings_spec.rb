require 'rails_helper'

describe 'User visits the book show page' do
  before :each do
    @book = Book.create(title: "Into Thin Air")
    @user1 = User.create(name: "Person")
    @user2 = User.create(name: "Different Person")
    @review1 = @book.reviews.create(body: "This book was bad.", rating: 1, user_id: @user1.id)
    @review2 = @book.reviews.create(body: "This book was good.", rating: 5, user_id: @user2.id)
  end

  it 'they see the average rating for the book' do
    visit book_path(@book)

    expect(page).to have_content("Average Rating: 3.0")
  end

  it 'they see the highest rating for the book' do
    visit book_path(@book)

    expect(page).to have_content("Highest Rating: 5")
  end

  it 'they see the lowest rating for the book' do
    visit book_path(@book)

    expect(page).to have_content("Lowest Rating: 1")
  end

  it 'they see the highest and lowest review' do
    visit book_path(@book)

    within('.review1') do
      expect(page).to have_content("This book was good.")
      expect(page).to have_content("Different Person")
    end
    within('.review2') do
      expect(page).to have_content("This book was bad.")
      expect(page).to have_content("Person")
    end
  end
end
