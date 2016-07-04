Rails.application.routes.draw do

  root 'welcome#index'

  get 'about' => 'welcome#about'

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

end