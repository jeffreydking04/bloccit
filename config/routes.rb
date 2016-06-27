Rails.application.routes.draw do

  root 'welcome#index'

  get 'about' => 'welcome#about'

  resources :posts

end