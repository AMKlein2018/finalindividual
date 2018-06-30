Rails.application.routes.draw do

  get "/profile/:id" => "profile#show"
  devise_for :users
  root 'blogs#index'
  # resources :blogs

  resources :blogs do
    resources :comments
  end
  
end
