FactoryGirl.define do
  factory :user, class: User do
    id  1
    salary 1200.0
  end
  
  factory :invalid_user, class: User do
    id 1
    salary nil
  end
end