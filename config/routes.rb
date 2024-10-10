Rails.application.routes.draw do
  resources :posts
  get 'rs_home/index', to: 'rs_home#index'
  get 'js_home/index', to: 'js_home#index'
  get 'js_home/get_form', to: 'js_home#get_form'
  get 'post' => 'post/index'
  root 'home#index'
  resources :home, only: [:index] do
    post 'create_user', on: :collection
  end
  resources :users
end
