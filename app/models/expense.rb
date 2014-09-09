class ExpensesValidator < ActiveModel::Validator
  def validate(record)
    if record.user_id == record.paid_for_user_id
      record.errors[:base] << "Paid_for_user cannot be equal to user"
    end
  end
end

class Expense < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :paid_for_user, :class_name => 'User', :foreign_key => 'paid_for_user_id'
  
  validates_with ExpensesValidator
  
  def self.expenses_in_time_period(date)
    Expense.where time_period: date
  end
  
  def self.total_cost(expenses=nil)
    if expenses.nil? 
      all.map{|e| e.cost}.sum
    else
      where(id: expenses).map{|e| e.cost}.sum
    end
  end
end
