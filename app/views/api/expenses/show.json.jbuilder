json.id @expense.id
json.user @expense.user.name
json.cost @expense.cost
json.time_period @expense.time_period.try(:strftime, "%B %Y")
json.paid_for_user @expense.paid_for_user.try(:name)
