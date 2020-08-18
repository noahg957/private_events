Rails.application.routes.draw do
  resources :events, only: [:new, :create, :show, :index] do
    post 'attend', on: :member
  end
  root 'events#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
