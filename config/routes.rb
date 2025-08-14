Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  devise_for :installs
  # Use the resources method to define all RESTful routes for blog_posts
  resources :blog_posts

  # Define the root path
  root "blog_posts#index"
end
 