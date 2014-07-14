class User < ActiveRecord::Base
  has_many :expenses, :class_name => 'Expense', :foreign_key => 'user_id'
  has_many :expenses_for_others, :class_name => 'Expense', :foreign_key => 'paid_for_user_id'
end
