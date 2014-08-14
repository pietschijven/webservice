FactoryGirl.define do
  # Expenses class
  factory :expense do
    user_id  1
    cost     2.45
    time_period Date.parse "August, 2014"
    paid_for_user nil
  end
end
