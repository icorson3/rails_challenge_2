require 'rails_helper'

RSpec.describe User do 
    describe "Validations" do 
        context "invalid attributes" do 
            it "is invalid without a name" do
                user = User.new

                expect(user).to be_invalid
            end
        end

        context "valid attributes" do
            it "is valid with a name" do 
                user = User.new(name: "Emma Swan")
                
                expect(user).to be_valid
            end
        end

    end

    describe "Relationships" do
        it "has many reviews" do
            user = User.new(name: "Emma Swan")

            expect(user).to respond_to(:reviews)
        end
    end
end