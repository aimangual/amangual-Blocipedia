Rails.application.routes.draw do
  devise_for :users

  get 'charges/create'

  get 'charges/new'

  get 'charges/downgrade'

  get 'about' => 'welcome#about'

  resources :wikis
  
  resources :charges, only: [:new, :create]
  
  root to: 'welcome#index'
end
