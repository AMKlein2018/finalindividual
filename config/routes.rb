Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/new'
  get 'comments/show'
  get 'comments/edit'
  get 'blogs/index'
  get 'blogs/new'
  get 'blogs/show'
  get 'blogs/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
