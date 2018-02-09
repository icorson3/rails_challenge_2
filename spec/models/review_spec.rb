require 'rails_helper'

describe Review, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_presence_of(:body) }
  end
end
