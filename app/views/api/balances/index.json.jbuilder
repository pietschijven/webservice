json.array!(@balances) do |balance|
  json.id balance.id
  
  json.balance balance.to_string
end
