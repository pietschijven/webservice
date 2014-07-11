class ChangeExpenses < ActiveRecord::Migration
  def change
    change_table :expenses do |t|
      t.remove :user
      t.rename :common, :paid_for_user
      t.string :month
    end
  end
end
