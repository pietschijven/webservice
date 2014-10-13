# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :expenses, 'Ausgaben', expenses_path do |expense|
      expense.item :new_expense, 'Neue ausgabe', new_expense_path
    end
    primary.item :balances, 'Abrechnungen', balances_path
    primary.item :users, 'Benutzer', users_path
  end
end
