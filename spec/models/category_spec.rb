require_relative '../rails_helper'

RSpec.describe Category, type: :model do
  before(:example) do
    @user = User.create(name: 'Fredo', email: 'fred@example.com', password: "123456", role: "admin")
  end

  context 'Validations' do
    it 'checks for name presence' do
      category = Category.new(author: @user, icon: 'https://cdn-icons-png.flaticon.com/512/31/3311579.png')
      expect(category.valid?).to eq false
    end

    it 'checks if icon is there' do
      category = Category.new(author: @user, name: 'Sport')
      expect(category.valid?).to eq false
    end

    it 'checks if there\'s a name and an icon' do
      category = Category.new(author: @user, name: 'Sport', icon: 'https://cdn-icons-png.flaticon.com/512/3311/33579.png')
      expect(category.valid?).to eq true
    end
  end

  context 'Associations' do
    it 'belongs to an author' do
      category = Category.reflect_on_association('author')
      expect(category.macro).to eq(:belongs_to)
    end
  end
end