class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.date :month
      t.text :balance_check

      t.timestamps
    end
  end
end
