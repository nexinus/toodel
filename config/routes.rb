Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :toilets do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: :create
  end

  resources :bookings, only: [:index, :show, :edit, :update]

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :toilets, only: [ :index, :show, :update, :create, :destroy ]
    end
  end

  # require "sidekiq/web"
  # authenticate :user, ->(user) { user.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
end
