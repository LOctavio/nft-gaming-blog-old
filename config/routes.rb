Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create]
  end
  get '/new_post', to: 'posts#new'
end
