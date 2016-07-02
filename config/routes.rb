Rails.application.routes.draw do

  root 'welcome#index'

  get 'about' => 'welcome#about'

  resources :topics do
    resources :posts, except: [:index]
  end

end