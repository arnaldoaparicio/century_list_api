Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :lists do
      end
    end
  end
get "/api/v1/lists/:list_id/:item_id", to: "api/v1/items#show"
end

