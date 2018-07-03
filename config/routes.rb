Rails.application.routes.draw do

 resources :blogs do
  resources :comments
 end

  get "/profile/:id" => "profile#show"

  patch "/users/:id", to: "user#update", as: 'edit_profile_favorites'
  devise_for :users
  root 'blogs#index'
  # resources :blogs

  resources :categories

  resources :blogs do
      member do
        put "like" => "blogs#upvote"
        put "unlike" => "blogs#downvote"
      end
  end

  resources :users

  # mount ActionCable.server => '/cable'

end

