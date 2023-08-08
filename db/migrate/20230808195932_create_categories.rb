class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |col|
      col.string :name
      col.integer :icon
      col.timestamps
      col.integer :author, :null => false, reference { to_table :users } 
    end
  endF
end
