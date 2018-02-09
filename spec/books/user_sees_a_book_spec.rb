require 'rails_helper'

describe 'As a user' do
  context 'when I visit a book show page' do
    before(:each) do
     @book = create(:book)
     @review_1 = create(:review, rating: 3)
     @review_2 =create(:review, rating: 5)
     @review_3 = create(:review, rating: 1)
     @reviews = [@review_1, @review_2, @review_3]
   end

    scenario 'I see the book title and body' do
      visit book_path(@book)

      expect(page).to have_content(@book.title)
      expect(page).to have_content(@book.body)
    end

    scenario 'I see a list of reviews including the body, the rating and the user that created that review' do
      visit book_path(@book)

      @reviews.each do |review|
        expect(page).to have_content(review.body)
        expect(page).to have_content(review.user)
        expect(page).to have_content(review.rating)
      end
    end

    scenario 'I see the average rating for that book' do
      visit book_path(@book)

      expect(page).to have_content("Average Rating : 3")
    end

    scenario 'I see the highest and lowest rating for that book and body and reviewer of each' do
      visit book_path(@book)

      expect(page).to have_content("Highest Rating: #{@review_2.rating} #{@review_2.user} #{@review_2.body}")
      expect(page).to have_content("Lowest Rating: #{@review_3.rating} #{@review_3.user} #{@review_3.body}")
    end
  end
end
