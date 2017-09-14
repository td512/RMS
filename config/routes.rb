Rails.application.routes.draw do
  root 'posts#new'
  # Login
scope '/login' do
  get '/'  => 'sessions#new', as: :login
  get '/error'  => 'sessions#error', as: :login_error
  get '/error/passwd'  => 'sessions#newpass', as: :login_passwd
  get '/session'  => 'sessions#loggedout', as: :login_session
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
  get '/error/email'  => 'users#emlerr', as: :emlerr
  get '/error/user'  => 'users#usrerr', as: :usrerr
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
  get '/', to: redirect('/')
  scope '/:id' do
    get '/' => 'posts#details'
    get '/share' => 'posts#share', as: :share
    post '/comment' => 'posts#comment', as: :comment
    get '/comment/:cid/delete' => 'dashboard#delcomment', as: :delcomment
    get '/:slug' => 'posts#details', as: :post
  end
end
scope '/users' do
  get '/manage' => 'dashboard#usrmgmt', as: :usrmgmt
  get '/make/admin/:id' => 'account#mkadmin', as: :mkadmin
  get '/make/user/:id' => 'account#mkusr', as: :mkusr
  get '/deactivate/:id' => 'account#deactivate', as: :deactivate
  get '/impersonate/:id' => 'account#impersonate', as: :impersonate
end
scope '/comments' do
  get '/moderation' => 'dashboard#moderation', as: :moderationq
  get '/approve/:id' => 'posts#approvecommment', as: :approvecommment
end
get '/category/:id' => 'posts#categories', as: :category
get '/profile/:id' => 'profile#new', as: :profile
get '/category', to: redirect('/')
get '/author-posts', to: redirect('/')
get '/search' => 'posts#search', as: :search
get '/author-posts/:q' => 'posts#author_search', as: :asearch
get '/dash' => 'dashboard#new', as: :dash
scope '/account' do
  get '/' => 'account#profile', as: :account
  post '/' => 'account#update'
end
end
