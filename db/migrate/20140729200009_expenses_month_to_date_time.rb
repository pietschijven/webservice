class ExpensesMonthToDateTime < ActiveRecord::Migration
  def change
    rename_column :expenses, :month, :date
    change_column(:expenses, :date, :datetime)
  end
end
