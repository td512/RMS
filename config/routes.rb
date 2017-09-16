Rails.application.routes.draw do
  root 'posts#new'
  # Login
scope '/login' do
  get '/'  => 'sessions#new', as: :login
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
  get '/impersonate/:id' => 'account#impersonate', as: :impersonate
  get '/stop-impersonation/:id' => 'account#stop_impersonate', as: :stopimpersonate
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
