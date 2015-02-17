Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    resources :expenses
    resources :users
    resources :balances
  end

  resources :expenses
  resources :users
  resources :balances
  
  root to: 'api/expenses#new'
end
