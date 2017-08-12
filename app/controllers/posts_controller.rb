class PostsController < ApplicationController
  def details
    if ! Post.first.nil?
      if params[:slug].nil?
        redirect_to post_path(params[:id], Post.find_by(id: params[:id]).slug)
      end
      if params[:slug] != Post.find_by(id: params[:id]).slug
        redirect_to post_path(params[:id], Post.find_by(id: params[:id]).slug)
      end
    else
      if Post.first.nil? && params[:id].present?
        redirect_to root_path
      end
    end
  end
end
