Rails.application.routes.draw do



  root to: "static_pages#root"

  resources :messages do
    get :open, :senddraft, on: :member

  end

  namespace :api, defaults: { format: :json } do
    resources :posts, only: [:index, :show, :create, :update,:destroy] do
      resources :comments, only: [:index, :create, :show]
    end
  end

  resources :posts do
    resources :comments
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