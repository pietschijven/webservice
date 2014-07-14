class Expense < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :paid_for_user, :class_name => 'User', :foreign_key => 'paid_for_user_id'
end
