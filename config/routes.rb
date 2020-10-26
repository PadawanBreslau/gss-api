Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sections, only: [:show, :index]
      resources :subsections, only: [:show]
      resources :locations, only: [:show]
      resources :utilities, only: [:show]
    end
  end
end
