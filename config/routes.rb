Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get "/customers/random", to: "random_customers#show"
      get "/customers/find", to: "customer_finders#show"
      get "/customers/find_all", to: "customer_finders#index"
      resources :customers, only: [:index, :show]

      get "/invoices/find", to: "invoice_finders#show"
      get "/invoices/find_all", to: "invoice_finders#index"
      get "/invoices/random", to: "random_invoices#show"
      resources :invoices, only: [:index, :show]

      get "/invoice_items/find", to: "invoice_items_finders#show"
      get "/invoice_items/find_all", to: "invoice_items_finders#index"
      get "/invoice_items/random", to: "random_invoice_items#show"
      resources :invoice_items, only: [:index, :show]

      get "/items/find", to: "item_finders#show"
      get "/items/find_all", to: "item_finders#index"
      get "/items/random", to: "random_items#show"
      resources :items, only: [:index, :show]

      get "/merchants/find", to: "merchant_finders#show"
      get "/merchants/find_all", to: "merchant_finders#index"
      get "/merchants/random", to: "random_merchants#show"
      resources :merchants, only: [:index, :show]

      get "/transactions/find", to: "transaction_finders#show"
      get "/transactions/find_all", to: "transaction_finders#index"
      get "/transactions/random", to: "random_transactions#show"
      resources :transactions, only: [:index, :show]
    end
  end
end
