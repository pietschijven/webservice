# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :balance do
    time_period Date.parse("2014-07-1")
    balance_check "MyText"
  end
end
