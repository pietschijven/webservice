# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :users, 'Users', users_path
    primary.item :expenses, 'Expenses', expenses_path
    primary.item :balances, 'Monthly balances', balances_path
  end
end
