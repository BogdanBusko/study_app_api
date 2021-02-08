Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    namespace :v1 do
      namespace :account do
        resources :profiles, only: :show
        resources :organizations, only: :create
      end

      resource :sessions, only: [:create, :destroy]

      post '/registration', to: 'registration#create'
    end
  end
end
