FactoryGirl.define do
  # Expenses class
  factory :expense do
    user_id  1
    cost     2.45
    month    "August"
    paid_for_user nil
  end
end
