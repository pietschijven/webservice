Rails.application.routes.draw do
  resources :expenses
  resources :users
  resources :balances
end
