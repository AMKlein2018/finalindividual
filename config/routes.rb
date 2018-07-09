Rails.application.routes.draw do

 resources :blogs do
  resources :comments
 end

  get "/profile/:id" => "profile#show", as: 'user_profile'
  # get 'blogs/landing' => "blogs#landing"

  patch "/users/:id", to: "user#update", as: 'edit_profile_favorites'
  
  devise_for :users
  
  root 'blogs#index'
  # resources :blogs

  resources :categories do
      member do
        put "like" => "blogs#upvote"
        put "dislike" => "blogs#downvote"
      end
  end


  resources :blogs do
      member do
        put "like" => "blogs#upvote"
        put "dislike" => "blogs#downvote"
      end
  end

  resources :users

  # mount ActionCable.server => '/cable'

end

