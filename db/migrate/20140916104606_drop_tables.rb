class DropTables < ActiveRecord::Migration
  def change
    drop_table :api_keys
    drop_table :balances
    drop_table :expenses
    drop_table :users
  end
end
