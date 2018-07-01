Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  get 'categories/edit'
  get 'categories/show'
  get "/profile/:id" => "profile#show"

  patch "/users/:id", to: "user#update", as: 'edit_profile_favorites'
  devise_for :users
  root 'blogs#index'
  # resources :blogs

  resources :blogs do
    resources :comments
  end

  resources :users

end

