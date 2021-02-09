Rails.application.routes.draw do
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
