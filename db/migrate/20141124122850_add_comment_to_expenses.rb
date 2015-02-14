class AddCommentToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :comment, :text
  end
end
