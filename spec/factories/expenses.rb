FactoryGirl.define do
  # Expenses class
  factory :expense do
    user_id  1
    cost     2.45
    time_period Date.parse "August, 2014"
    paid_for_user_id nil
  end
  
  # Invalid because paid_for_user_id == user_id
  factory :invalid_expense, class: Expense do
    user_id 1
    cost 2.45
    time_period Date.parse "August, 2014"
    paid_for_user_id 1
  end
end
