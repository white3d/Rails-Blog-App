Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'

  get 'posts/new', to: 'posts#new'
  get 'comments/new', to: 'comments#new'

  post 'posts/', to: 'posts#create'
  post 'comments/', to: 'comments#create'

  post '/users/:user_id/posts/:id/likes', to: 'likes#create'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: [:create, :new]
    end
  end
  
end