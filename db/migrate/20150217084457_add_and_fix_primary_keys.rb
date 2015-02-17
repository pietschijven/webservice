class AddAndFixPrimaryKeys < ActiveRecord::Migration
  def change
    change_table :balances do |t|
      t.index :id
    end
    
    change_table :expenses do |t|
      t.index :id
    end
    
    change_table :users do |t|
      t.index :id
    end
  end
end
