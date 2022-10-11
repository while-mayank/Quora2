Rails.application.routes.draw do
  resources :addresses
  resources :profiles
  resources :blogs
  resources :websites

  get 'homes/index'

  get 'blogs/index', to: "blog#index"

  # get 'blogs/user/:id', to: "blogs#blog_user", as: "blog_user"

  # get 'websites/user/:id', to: "websites#website_user", as: "website_user"

  devise_for :users, controllers: {
    sessions: 'users/sessions', 
  }

  root to: "homes#index"
end
