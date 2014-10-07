# Steps for the balance JSON api feature

Given(/^the following users exist:$/) do |users_table|
  users_table.hashes.each do |user|
    User.create user
  end
end

Given(/^the following expenses exist:$/) do |expenses_table|
  expenses_table.hashes.each do |expense|
    Expense.create(:user_id => User.find_by_name(expense[:name]).id,
      :cost => expense[:cost],
      :time_period => Date.parse(expense[:time_period])
    )
  end
end

Given(/^the account balances have been created$/) do
  time_periods = Expense.pluck :time_period
  time_periods.each do |time_period|
    b = Balance.new time_period: time_period
    b.create_balance
  end
end

When(/^I request the account balance for "(.*?)"$/) do |date|
  time_period = Date.parse date
  balance_id = Balance.find_by_time_period time_period
  get api_balance_path balance_id
end

Then(/^"(.*?)" should pay "(.*?)"$/) do |name, amount|
  json_response = JSON.parse(last_response.body)
  amount_to_pay = json_response["balance"][name]
  expect(amount_to_pay.round(2)).to eq amount.to_f
end

When(/^"(.*?)" adds the expense "(.*?)" for "(.*?)"$/) do |name, cost, time_period|
  Expense.create(:user_id => User.find_by_name(name).id,
    :cost => cost,
    :time_period => Date.parse(time_period)
  )
end

When(/^"(.*?)" updates and subsequently requests the account balance for "(.*?)"$/) do |name, time_period|
  balance = Balance.find_by_time_period Date.parse(time_period)
  balance.create_balance
  step "I request the account balance for \"#{time_period}\""
end
