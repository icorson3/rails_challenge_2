require 'rails_helper'

RSpec.describe User
describe "Validations" do
  context "invalid attributes" do
    it "is invalid without a name" do
      user = User.new

      expect(user).to be_invalid
    end
  end
end
