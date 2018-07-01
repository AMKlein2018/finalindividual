Rails.application.routes.draw do

  get "/profile/:id" => "profile#show"

  patch "/users/:id", to: "user#update", as: 'edit_profile_favorites'
  devise_for :users
  root 'blogs#index'
  # resources :blogs

  resources :categories

  resources :blogs do
    resources :comments
  end

  resources :users

end

