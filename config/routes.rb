Rails.application.routes.draw do
  resources :var_budget_items
  resources :budget_items
  resources :incomes
  resources :budgets
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "/users/login", to: "users#login"
  # Defines the root path route ("/")
  # root "articles#index"
end
