json.array!(@balances) do |balance|
  json.id balance.id
  json.time_period balance.time_period_string
  json.balance balance.to_string
end
