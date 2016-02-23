Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get "/customers/find", to: "customer_finders#show"
      get "/customers/find_all", to: "customer_finders#index"
      get "/customers/random", to: "random_customers#show"
      resources :customers, only: [:index, :show]
    end
  end
end
