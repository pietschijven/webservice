json.array!(@expenses) do |expense|
  json.extract! expense, :id, :user, :cost, :common
  json.url expense_url(expense, format: :json)
end
