# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_id_list = User.all.map {|x| x.id}
month_list = ["January, 2014", "February, 2014", "March, 2014", "April, 2014", "May, 2014", "June, 2014", "July, 2014", "August, 2014", "September, 2014", "October, 2014", "November, 2014", "December, 2014"].map {|x| Date.parse x}

expenses_list = []

100.times do |x|
  expenses_list << {:cost => rand(500)/10.0, :user_id => user_id_list[rand(2)], :time_period => month_list[rand(12)]}
end

expenses_list.each do |expense|
  Expense.create expense
end
