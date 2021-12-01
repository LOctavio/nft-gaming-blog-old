Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get "/login" => "users/sessions#new"
    get "/logout" => "users/sessions#destroy"
    get "/register" => "users/registrations#new"
  end                                                                            
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
  get '/new_post', to: 'posts#new'
end
