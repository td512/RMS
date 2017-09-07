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
# Verify
scope '/verify' do
  get '/' => 'verify#new', as: :verify
  post '/' => 'verify#verify'
  get '/error' => 'verify#error', as: :verify_error
end
# Settings
scope '/settings' do
  get '/' => 'dashboard#settings', as: :settings
  get '/pick' => 'dashboard#settings_chooser', as: :chooser
  post '/' => 'dashboard#apply'
end
# Write
scope '/write' do
  get '/' => 'posts#write', as: :write
  post '/' => 'posts#post'
  get '/edit/:id' => 'posts#edit', as: :edit
  post '/edit/:id' => 'posts#update', as: :update
end
scope '/manage' do
  get '/' => 'posts#manage', as: :manage
  scope '/links' do
    get '/' => 'dashboard#link', as: :link
    get '/add' => 'dashboard#addlink', as: :addlink
    post '/add' => 'dashboard#linkadd'
    get '/delete/:id' => 'dashboard#dellink', as: :linkdelete
  end
  scope '/menus' do
    get '/' => 'dashboard#menu', as: :menu
    get '/add' => 'dashboard#addmenu', as: :addmenu
    post '/add' => 'dashboard#menuadd'
    get '/delete/:id' => 'dashboard#delmenu', as: :menudelete
  end
  get '/delete/:id' => 'posts#delete', as: :delete
end
# Posts
scope '/posts' do
  get '/:id' => 'posts#details'
  get '/:id/share' => 'posts#share', as: :share
  get '/:id/:slug' => 'posts#details', as: :post
end
get '/category/:id' => 'posts#categories', as: :category
get '/search' => 'posts#search', as: :search
get '/author-posts/:q' => 'posts#author_search', as: :asearch
get '/dash' => 'dashboard#new', as: :dash
get '/soon' => 'posts#mock'
end
