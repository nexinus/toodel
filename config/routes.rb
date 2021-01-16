Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :toilets do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: :create
  end

  resources :bookings, only: [:index, :show, :edit, :update]
end
