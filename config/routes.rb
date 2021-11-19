Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :show] do
      resources :comments, only: [:new, :create]
    end
  end
  get 'new_post', to: 'posts#new'
end
