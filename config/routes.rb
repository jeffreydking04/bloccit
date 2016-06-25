Rails.application.routes.draw do

  root 'welcome#index'

  resources :welcome, only: [:index, :about]

  get 'about' => 'welcome#about'

end