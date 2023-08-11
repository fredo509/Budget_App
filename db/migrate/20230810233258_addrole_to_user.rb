class AddroleToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |table|
      table.string :role, default: 'user'
    end  
  end
end
