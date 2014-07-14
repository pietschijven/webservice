class FixReferences < ActiveRecord::Migration
  def change
    add_index :expenses, :paid_for_user_id
  end
end
