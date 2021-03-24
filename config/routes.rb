Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      namespace :account do
        resource :profiles, only: :show
        resources :organizations, only: :create
      end

      resource :sessions, only: [:create, :destroy]

      post '/registration', to: 'registration#create'
    end
  end
end
