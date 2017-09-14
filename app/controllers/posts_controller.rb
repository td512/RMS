class PostsController < ApplicationController
  before_action :require_user, except: [:details, :new, :author_search, :categories, :share, :search]
  before_action :check_user, except: [:details, :new, :author_search, :categories, :share, :search]
  before_action :check_admin, except: [:details, :new, :author_search, :categories, :share, :comment, :search]
  before_action :check_activated, except: [:details, :new, :author_search, :categories, :share, :search]
  def search
    if params[:q].nil?
      redirect_to root_path
    end
  end
  def new
    session[:return_url] = nil
  end
  def approvecommment
    comment = Comment.find_by(id: params[:id])
    comment.awaiting_moderation = "0"
    if comment.save
      redirect_to moderationq_path
    end
  end
  def comment
    comment = Comment.new()
    comment.owner = current_user.id
    comment.deleted = "0"
    comment.awaiting_moderation = "1"
    if params[:comment][:content].present?
      comment.content = params[:comment][:content]
    end
    comment.post_id = params[:id]
    post = Post.find_by(id: params[:id])
    post.post_comments = post.post_comments.to_i + 1
    post.save
    if comment.save && verify_recaptcha(model: comment, secret_key: Setting.limit(1).pluck(:recaptcha_private).first)
      url = session[:return_url]+"#"+comment.id.to_s
      redirect_to url
    end
  end
  def share
    post = Post.find_by(id: params[:id])
    post.post_shares = post.post_shares.to_i + 1
    post.save
  end
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
      post = Post.find_by(id: params[:id])
      post.post_views = Post.find_by(id: params[:id]).post_views.to_i + 1
      post.save
      session[:return_url] = request.url

    end
  end
end
