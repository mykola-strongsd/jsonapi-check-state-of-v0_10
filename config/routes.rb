Rails.application.routes.draw do
  # resources :tags
  # resources :users
  # resources :comments
  # resources :articles

  namespace :api do
    # scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
    scope module: :v1 do
      jsonapi_resource :user, only: [:show, :update]
      jsonapi_resources :articles
      jsonapi_resources :comments
      jsonapi_resources :tags
    end
  end
end
