Rails.application.routes.draw do

  root 'welcome#index'

  get 'about' => 'welcome#about'

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  post 'users/confirm' => 'users#confirm'

end