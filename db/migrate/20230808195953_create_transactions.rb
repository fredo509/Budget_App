class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |col|
      col.string :name,
      col.double :amount,
      col.timestamps
      col.integer :author, :null => false, reference { to_table :users } 
      col.integer :transaction, :null => false, reference { to_table :transactions } 
    end
  end
end
