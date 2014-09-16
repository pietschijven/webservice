class RecreateForeignKeys < ActiveRecord::Migration
  def change
    add_index :expenses, :paid_for_user_id
    add_index :expenses, :user_id
  end
end
