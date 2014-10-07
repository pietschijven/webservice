json.array!(@users) do |user|
  json.id user.id
  json.name user.name
  json.salary user.salary
end
