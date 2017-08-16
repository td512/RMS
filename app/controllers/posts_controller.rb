class PostsController < ApplicationController
  def post
    post = Post.new()
    post.owner = current_user.first_name
    post.post_title = params[:write][:title]
    post.post_subtitle = params[:write][:subtitle]
    post.post_body = params[:write][:content]
    post.post_category = params[:write][:tags]
    post.slug = params[:write][:title].parameterize
    if post.save
      redirect_to post_path(post.id, post.slug)
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
