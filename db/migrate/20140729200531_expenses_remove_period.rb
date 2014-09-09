class ExpensesRemovePeriod < ActiveRecord::Migration
  def change
    change_table :expenses do |t|
      t.remove :date
      t.datetime :time_period
    end
  end
end
