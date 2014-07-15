class Expense < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :paid_for_user, :class_name => 'User', :foreign_key => 'paid_for_user_id'
  
  def paid_for_user_name
    expense = Expense.find(self.id)
    expense.paid_for_user.nil? ? "" : expense.paid_for_user.name
  end
end
