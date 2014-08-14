class Balance < ActiveRecord::Base
  validates :time_period, uniqueness: true
  
  def create_balance
    self.save
  end
end
