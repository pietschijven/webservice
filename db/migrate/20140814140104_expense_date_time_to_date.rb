class ExpenseDateTimeToDate < ActiveRecord::Migration
  def change
    change_table :expenses do |t|
      t.remove :time_period
      t.date :time_period
    end
  end
end
