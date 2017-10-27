require 'rails_helper'

RSpec.describe Review do
    describe 'Validations' do
        before :each do 
            @user = User.new(name: "Emma Swan")
            @book = Book.new(title: "Peter Pan")
        end

        context 'invalid attributes' do 
            it 'is invalid without a user' do 
                review = Review.new(book: @book,
                                    rating: 4,
                                    body: "Favorite children's story.")

                expect(review).to be_invalid
            end

            it 'is invalid without a book' do 
                review = Review.new(user: @user,
                                    rating: 4,
                                    body: "Favorite children's story.")

                expect(review).to be_invalid
            end

            it 'is invalid without a rating' do 
                review = Review.new(user: @user,
                                    book: @book,
                                    body: "Favorite children's story.")

                expect(review).to be_invalid
            end

            it 'is invalid without a body' do 
                review = Review.new(user: @user,
                                    book: @book,
                                    rating: 4)

                expect(review).to be_invalid
            end
        end

        context 'valid attributes' do 
            it 'is valid with a user, book, rating, and body' do 
                review = Review.new(user: @user,
                                    book: @book,
                                    rating: 4,
                                    body: "Favorite children's story.")

                expect(review).to be_valid
            end
        end
    end

    describe 'relationships' do 

    end
end