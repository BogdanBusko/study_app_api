Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    namespace :v1 do
      resource :sessions, only: [:create, :destroy]
      resources :users, only: [:index]

      post '/registration', to: 'registration#create'
    end
  end
end
