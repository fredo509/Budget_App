require_relative '../rails_helper'

RSpec.describe Transaction, type: :model do
  before(:example) do
    @user = User.create(name: 'Fredo', email: 'fred@example.com', password: "123456")
    @category = Category.new(author: @user, name: 'Sport', icon: 'https://cdn-icons-png.flaticon.com/512/3311/3311579.png')
  end

  context 'Validations' do
    it 'should have a name' do
      transaction = Transaction.new(author: @user, amount: 20, category_ids: [@category.id])
      expect(transaction.valid?).to eq false
    end

    it 'should have an amount' do
      transaction = Transaction.new(author: @user, name: 'Shoes', category_ids: [@category.id])
      expect(transaction.valid?).to eq false
    end

    it 'should have both a name and an amount' do
      transaction = Transaction.new(author: @user, name: 'Buy sneakers', amount: 45, category_ids: [@category.id])
      expect(transaction.valid?).to eq true
    end
  end

  context 'Associations' do
    it 'belongs to an author' do
      transaction = Transaction.reflect_on_association('author')
      expect(transaction.macro).to eq(:belongs_to)
    end

    it 'has many categories' do
      transaction = Transaction.reflect_on_association('categories')
      expect(transaction.macro).to eq(:has_many)
    end
  end
end