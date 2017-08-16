class PostsController < ApplicationController
  before_action :require_user, except: [:details, :new, :author_search, :categories]
  before_action :check_user, except: [:details, :new, :author_search, :categories]
  before_action :check_admin, except: [:details, :new, :author_search, :categories]
  before_action :check_activated, except: [:details, :new, :author_search, :categories]
  def update
    post = Post.find_by(id: params[:id])
    if params[:write][:title].present?
      post.post_title = params[:write][:title]
    end
    if params[:write][:subtitle].present?
      post.post_subtitle = params[:write][:subtitle]
    end
    if params[:write][:content].present?
      post.post_body = params[:write][:content]
    end
    if params[:write][:tags].present?
      post.post_category = params[:write][:tags]
    end
    if params[:write][:title].present?
      post.slug = params[:write][:title].parameterize
    end
    if post.save
      redirect_to manage_path
    end
    end
  def delete
    post = Post.find_by(id: params[:id])
    post.delete
    redirect_to manage_path
  end
  def post
    post = Post.new()
    post.owner = current_user.id
    if params[:write][:title].present?
      post.post_title = params[:write][:title]
    else
      post.post_title = "I forgot the post title!"
    end
    if params[:write][:subtitle].present?
      post.post_subtitle = params[:write][:subtitle]
    end
    if params[:write][:content].present?
      post.post_body = params[:write][:content]
    else
      post.post_body = "...and body content"
    end
    if params[:write][:tags].present?
      post.post_category = params[:write][:tags]
    end
    if params[:write][:title].present?
      post.slug = params[:write][:title].parameterize
    else
      post.slug = "forgot-the-title"
    end
    if post.save
      redirect_to manage_path
    end
  end
  def details
    if Post.first.nil?
      if Post.first.nil? && params[:id].present?
        redirect_to root_path
      else
      redirect_to '/404'
    end
    elsif ! Post.find_by(id: params[:id]).nil?
      if params[:slug].nil?
        redirect_to post_path(params[:id], Post.find_by(id: params[:id]).slug)
      end
      if params[:slug] && params[:slug] != Post.find_by(id: params[:id]).slug
        redirect_to post_path(params[:id], Post.find_by(id: params[:id]).slug)
      end
    end
  end
end
