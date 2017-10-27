require 'rails_helper'

RSpec.describe Book do 
    describe "Validations" do
        context "invalid attributes" do 
            it "is invalid without a title" do 
                book = Book.new

                expect(book).to be_invalid
            end
        end

        context "valid attributes" do 
            it "is valid without a title" do 
                book = Book.new(title: "Peter Pan")

                expect(book).to be_valid
            end
        end
    end
    
    describe "Relationships" do 
        it "has many reviews" do 
            book = Book.new(title: "Peter Pan")
            
            expect(book).to be_valid
            expect(book).to respond_to(:reviews)
        end

    end
end
