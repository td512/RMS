Rails.application.routes.draw do
  root 'posts#new'
  # Login
scope '/login' do
  get '/'  => 'sessions#new', as: :login
  get '/error'  => 'sessions#error'
  get '/error/passwd'  => 'sessions#newpass'
  get '/session'  => 'sessions#loggedout'
  post '/'  => 'sessions#create'
end
# Logout
scope '/logout' do
  get '/' => 'sessions#destroy', as: :logout
end
# Reset
scope '/reset' do
  get '/' => 'reset#new', as: :reset
  post '/' => 'reset#check'
  get '/error' => 'reset#error', as: :reset_error
  get '/change/error' => 'reset#chgerror', as: :reset_error_reset
  get '/done' => 'reset#done', as: :reset_done
  get '/:id' => 'reset#reset'
  post '/:id' => 'reset#change', as: :reset_reset
end
# Signup
scope '/signup' do
  get '/'  => 'users#new', as: :signup
  get '/error/email'  => 'users#emlerr'
  post '/'  => 'users#create'
end
get '/posts/:id' => 'posts#details'
get '/posts/:id/:slug' => 'posts#details', as: :post
get '/category/:id' => 'posts#categories', as: :category
get '/search' => 'posts#search', as: :search
end
