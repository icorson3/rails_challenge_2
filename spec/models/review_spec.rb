require 'rails_helper'

describe Review, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:rating) }
  end

  describe "relationships" do
    it {should belong_to(:book) }
  end
end
