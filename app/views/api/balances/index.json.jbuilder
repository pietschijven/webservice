json.array!(@balances) do |balance|
  json.id balance.id
  
  json.balance balance.balance_check_with_usernames
end
