require_relative '../rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it 'should have a name' do
      user = User.new(name: "Fredo St Fleur", email: 'fred@example.com', password: "123456")
      user.save!
      expect(user.valid?).to eq true
    end

    it 'should have a string name' do
      user = User.new(name: "Fredo St Fleur", email: 'fred@example.com', password: "123456")
      expect(user.valid?).to eq true
    end
  end
    context 'Associations' do
        it 'has many categories' do
        user = User.reflect_on_association('categories')
        expect(user.macro).to eq(:has_many)
        end
    end 
end
