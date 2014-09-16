class RecreateTables < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token
    end
    
    create_table :expenses do |t|
      t.float    :cost
      t.integer  :paid_for_user_id
      t.integer  :user_id
      t.date     :time_period
    end
    
    create_table :users do |t|
      t.string :name
      t.float :salary
    end
    
    create_table :balances do |t|
      t.date :time_period
      t.text :balance_check
    end
  end
end
