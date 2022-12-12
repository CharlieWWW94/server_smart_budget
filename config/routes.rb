Rails.application.routes.draw do
  
  
  resources :users, only: [:create, :update, :destroy]
    post "/users/login", to: "users#login"

  resources :incomes, only: [:create, :update, :destroy]
  resources :budgets, only: [:show, :create, :update, :destroy] do
    resources :var_budget_items, only: [:create, :update, :destroy]
    resources :budget_items, only: [:create, :update, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end
