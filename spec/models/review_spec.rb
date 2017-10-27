require 'rails_helper'

RSpec.describe Review, type: :model do
  context "validations" do
    it { should validate_presence_of(:body) }
  end

  context "relationships" do
    it { should belong_to(:book) }
    it { should belong_to(:user) }
  end
end