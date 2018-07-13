require 'rails_helper'

describe User do
  describe 'relationships' do
    it 'should have many reviews' do
      user_1 = User.create!(name:'troll')
      expect(user_1).to respond_to(:reviews)
    end
  end
end
