require 'rails_helper'

RSpec.describe 'user visits book show page' do
    before :each do
        book = Book.create(title: "Peter Pan")
    end
    
    scenario 'user sees book title and reviews for that book' do
        visit book_path(book)

        expect(current_path).to eq(book_path(book))
        expect(page).to have_content("Peter Pan")
        expect(page).to have_content("Reviews:")        
    end
end