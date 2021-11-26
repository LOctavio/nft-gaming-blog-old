Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
  get '/new_post', to: 'posts#new'
end
