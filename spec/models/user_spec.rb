require 'rails_helper'

describe User do
  describe "relationships" do
    it "has many reviews" do
      user = User.create(name: "Ellen")
      expect(user).to respond_to(:reviews)
    end
  end
end
