class DashboardController < ApplicationController
before_action :require_user
before_action :check_user
before_action :check_admin
before_action :check_activated
def apply
  if Setting.first.nil?
    settings = Setting.new()
    if params[:settings][:blog_name].present?
      settings.blog_name = params[:settings][:blog_name]
    end
      if params[:settings][:blog_email].present?
        settings.blog_email = params[:settings][:blog_email]
      end
        if params[:settings][:blog_tagline].present?
          settings.blog_tagline = params[:settings][:blog_tagline]
        end
          if params[:settings][:blog_twitter].present?
            settings.blog_twitter = params[:settings][:blog_twitter]
          end
            if params[:settings][:blog_facebook].present?
              settings.blog_facebook = params[:settings][:blog_facebook]
            end
              if params[:settings][:blog_about].present?
                settings.blog_about = params[:settings][:blog_about]
              end
              if params[:settings][:blog_appid].present?
                settings.blog_appid = params[:settings][:blog_appid]
              end
              if params[:settings][:blog_css].present?
                settings.blog_css = params[:settings][:blog_css]
              end
    elsif ! Setting.first.nil?
      settings = Setting.first
      if params[:settings][:blog_name].present?
        settings.blog_name = params[:settings][:blog_name]
      end
        if params[:settings][:blog_email].present?
          settings.blog_email = params[:settings][:blog_email]
        end
          if params[:settings][:blog_tagline].present?
            settings.blog_tagline = params[:settings][:blog_tagline]
          end
            if params[:settings][:blog_twitter].present?
              settings.blog_twitter = params[:settings][:blog_twitter]
            end
              if params[:settings][:blog_facebook].present?
                settings.blog_facebook = params[:settings][:blog_facebook]
              end
              if params[:settings][:blog_about].present?
                settings.blog_about = params[:settings][:blog_about]
              end
              if params[:settings][:blog_appid].present?
                settings.blog_appid = params[:settings][:blog_appid]
              end
              if params[:settings][:blog_css].present?
                settings.blog_css = params[:settings][:blog_css]
              end
      end
    if settings.save
      redirect_to settings_path
    end
end
def new
end
end
