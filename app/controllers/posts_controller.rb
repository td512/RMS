class PostsController < ApplicationController
  def details
    if ! Post.first.nil? && ! Post.find_by(id: params[:id]).nil?
      if params[:slug].nil?
        redirect_to post_path(params[:id], Post.find_by(id: params[:id]).slug)
      end
      if params[:slug] && params[:slug] != Post.find_by(id: params[:id]).slug
        redirect_to post_path(params[:id], Post.find_by(id: params[:id]).slug)
      end
    else
      if Post.first.nil? && params[:id].present?
        redirect_to root_path
      end
      redirect_to '/404'
    end
  end
end
