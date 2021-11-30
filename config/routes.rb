Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end                                                                            
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
  get '/new_post', to: 'posts#new'
  get '/login', to: 'devise/sessions#new'
end
