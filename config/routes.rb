Rails.application.routes.draw do

  root to: "static_pages#root"

  namespace :api, defaults: { format: :json } do
    resources :posts, only: [:index, :show, :destoy] do
      resources :comments, only: [:new, :create]
    end
  end

  resources :posts do
    resources :comments, only: [:new, :create, :destroy]
  end


  get '/auth/facebook/callback', to: 'sessions#facebook_login'

  resources :comments, except: [:new, :create] do
    resources :comments, only: [:new, :create, :show]
  end

  resources :channels, only: [:show, :destroy]



  resources :subs do
    resources :channels, only: [:new, :create]
  end



  resources :users, only:[:new, :create, :show, :update, :index] do
    get :activate, on: :collection
  end


  resource :session, only: [:new, :create, :destroy]

  # root "subs#index"

end
