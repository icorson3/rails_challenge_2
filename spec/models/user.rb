require 'rails-helper'

describe User do

  describe 'validations' do

    it 'pass with a name' do
      user = User.new(name: 'name')
      expect(user).to be_valid
    end

    it 'fail without a name' do
      user = User.new
      expect(user).to be_invalid
    end

  end

end
