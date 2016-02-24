Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get "/customers/random", to: "customers/random#show"
      get "/customers/find_all", to: "customers/finders#index"
      get "/customers/find", to: "customers/finders#show"
      resources :customers, only: [:index, :show]

      get "/invoices/find", to: "invoices/finders#show"
      get "/invoices/find_all", to: "invoices/finders#index"
      get "/invoices/random", to: "invoices/random#show"
      resources :invoices, only: [:index, :show]
      get "/invoices/:id/transactions", to: "invoices/transactions#index"

      get "/invoice_items/find", to: "invoice_items/finders#show"
      get "/invoice_items/find_all", to: "invoice_items/finders#index"
      get "/invoice_items/random", to: "invoice_items/random#show"
      resources :invoice_items, only: [:index, :show]

      get "/items/find", to: "items/finders#show"
      get "/items/find_all", to: "items/finders#index"
      get "/items/random", to: "items/random#show"
      resources :items, only: [:index, :show]

      get "/merchants/find", to: "merchants/finders#show"
      get "/merchants/find_all", to: "merchants/finders#index"
      get "/merchants/random", to: "merchants/random#show"
      resources :merchants, only: [:index, :show]
      get "merchants/:id/items", to: "merchants/items#index"
      get "merchants/:id/invoices", to: "merchants/invoices#index"

      get "/transactions/find", to: "transactions/finders#show"
      get "/transactions/find_all", to: "transactions/finders#index"
      get "/transactions/random", to: "transactions/random#show"
      resources :transactions, only: [:index, :show]
    end
  end
end
