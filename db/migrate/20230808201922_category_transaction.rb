class CategoryTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :category_transactions do |col|
      col.references :category, null: false, foreign_key: true
      col.references :transaction, null: false, foreign_key: true
      col.timestamps
  end
end
