class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.float :amount, default:0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
