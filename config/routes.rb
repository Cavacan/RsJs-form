Rails.application.routes.draw do
  get 'js_home/index', to: 'js_home#index'
  root 'home#index'
  resources :home, only: [:index] do
    post 'create_user', on: :collection
  end
  resources :users
end
