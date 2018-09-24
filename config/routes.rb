Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "registrations"
  }
  resources :users, only: [:show, :index, :destroy] do
    member do
      get :following, :followers
    end
  end
  resources :users do
    collection do
      get :tigers
    end
  end
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :contacts, only: [:new, :create]
  root  'static_pages#home'
  get 'help', to: 'static_pages#help', as: :help
  get 'about',   to: 'static_pages#about',   as: :about
  # get 'contact', to: 'static_pages#contact', as: :contact
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
