json.array!(@expenses) do |expense|
  json.id expense.id
  json.user expense.user.name
  json.cost expense.cost
  json.month expense.month
  json.paid_for_user expense.paid_for_user
end
