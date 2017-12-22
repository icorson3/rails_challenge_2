require "rails_helper"

describe Reviews, type: :model do
  describe "validations" do
    it {should validate_presence_of(:body)}
    it {should validate_presence_of(:rating)}
  end

  describe "relationships" do
    it {should belong_to(:book)}
    it {should belong_to(:user)}
  end

end
