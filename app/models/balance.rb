class Balance < ActiveRecord::Base
  validates :time_period, uniqueness: true
  serialize :balance_check, Hash
  
  def create_balance
    balance_data = compute_balance self.time_period 
    self.balance_check = balance_data
    self.save
  end
  
  private
  
  def compute_balance(date)
    expenses_list = Expense.expenses_in_time_period date
    total_costs = expenses_list.total_cost
    balance = {}
    
    User.all.each do |u|
      user_expenses = expenses_list.where user_id: u.id
      user_total_costs = user_expenses.total_cost
      user_should_pay = u.salary_fraction * total_costs
      balance[u.id] = user_should_pay - user_total_costs
    end
    
    return balance
  end
end
