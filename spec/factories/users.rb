FactoryGirl.define do
  factory :user, class: User do
    salary 1200.0
    name "Hans"
  end
  
  factory :invalid_user, class: User do
    salary nil
    name "Hansdegans"
  end
end
