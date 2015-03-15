class Balance < ActiveRecord::Base
  validates :time_period, uniqueness: true
  serialize :balance_check, Hash
  
  def create_balance
    self.balance_check = compute_balance(self.time_period)
    self.save
  end
  
  def update_balance(params)
    self.update params
    create_balance
  end
  
  def time_period_string
    time_period.try(:strftime, "%B %Y")
  end
  
  def total_balance
    balance_check.values.inject(0) {|result, element| result + element.abs}
  end
  
  def balance_check_with_usernames
    b = Hash.new
    balance_check.each do |k,v|
      key = User.find(k).name
      b[key] = v 
    end
    return b
  end
  
  #only works with 2 users
  def compute_balance(date)
    expenses_list = Expense.expenses_in_time_period(date).where(paid_for_user_id: nil)
    total_costs = expenses_list.total_cost
    
    balance = Hash.new
    
    User.all.each do |u|
      user_expenses = expenses_list.where user_id: u.id
      user_total_costs = user_expenses.total_cost
      user_should_pay = u.salary_fraction * total_costs
      balance[u.id] = user_should_pay - user_total_costs
    end
    
    # Now settle paid_for_user stuff
    expenses_list = Expense.expenses_in_time_period(date).where.not(paid_for_user_id: nil)
    User.all.each do |u|
      user_expenses = expenses_list.where user_id: u.id
      unless user_expenses.empty?
        user_advanced_payments = user_expenses.total_cost
        balance[u.id] -= user_advanced_payments
      end
    end
    
    return balance
  end
  
  def self.refresh(period)
    period = period.beginning_of_month
    b = Balance.where time_period: period
    
    if b.empty?
      new_balance = Balance.new time_period: period
      new_balance.create_balance
    else
      b.first.update_balance time_period: period
    end
  end
  
  def to_string
    b = balance_check_with_usernames.to_a
    if b[0][1] > 0
      return b[0][0] + " has to pay " + b[0][1].round(2).to_s + " Euro to " + b[1][0]
    else
      return b[1][0] + " has to pay " + b[1][1].round(2).to_s + " Euro to " + b[0][0]
    end
  end
end
