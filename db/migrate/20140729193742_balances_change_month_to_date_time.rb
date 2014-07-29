class BalancesChangeMonthToDateTime < ActiveRecord::Migration
  def change
    rename_column :balances, :month, :time_period 
  end
end
