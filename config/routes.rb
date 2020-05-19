Rails.application.routes.draw do
  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      jsonapi_resource :me, only: [:show, :update]
      jsonapi_resources :authors

      # dummy routes
      jsonapi_resources :articles
      jsonapi_resources :comments
      jsonapi_resources :tags
    end
  end
end
