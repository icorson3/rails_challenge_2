require 'rails_helper'

RSpec.describe Review
describe "Validations" do
  context "invalid attributes" do
    it "is invalid without a body" do
      review = Review.new

      expect(review).to be_invalid
    end
    it "is invalid without a rating" do
      review = Review.new

      expect(review).to be_invalid
    end
    
  end
end
