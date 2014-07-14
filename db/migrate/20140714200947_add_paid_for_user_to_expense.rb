class AddPaidForUserToExpense < ActiveRecord::Migration
  def change
    change_table :expenses do |t|
      t.rename :paid_for_user, :paid_for_user_id  
    end
  end
end
