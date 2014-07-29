class Balance < ActiveRecord::Base
  def create_balance
    self.save
  end
end
