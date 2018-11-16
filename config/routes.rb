Rails.application.routes.draw do

 mount ActionCable.server => '/cable'
 
  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end


  
 resources :blogs do
  resources :comments
 end

  get '/api' => "blogs#api"

  get "/profile/:id" => "profile#show", as: 'user_profile'
  get '/landing' => "blogs#landing", as: 'blogs_landing'

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

  

end

