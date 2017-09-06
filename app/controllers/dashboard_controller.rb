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
              if params[:settings][:blog_logo].present?
                settings.blog_logo = params[:settings][:blog_logo]
              end
              if params[:settings][:blog_css_bg].present?
                settings.blog_css_bg = params[:settings][:blog_css_bg]
              else
                settings.blog_css_bg = '#F4F4F4'
              end
              if params[:settings][:blog_css_header].present?
                settings.blog_css_header = params[:settings][:blog_css_header]
              else
                settings.blog_css_header = '#FFF'
              end
              if params[:settings][:blog_css_tc].present?
                settings.blog_css_tc = params[:settings][:blog_css_tc]
              else
                settings.blog_css_tc = '#000'
              end
              if params[:settings][:blog_css_post].present?
                settings.blog_css_post = params[:settings][:blog_css_post]
              else
                settings.blog_css_post = '#FFF'
              end
              if params[:settings][:blog_css_button].present?
                settings.blog_css_button = params[:settings][:blog_css_button]
              else
                settings.blog_css_button = '#5DBEB3'
              end
              if params[:settings][:dash_css_bg].present?
                settings.dash_css_bg = params[:settings][:dash_css_bg]
              else
                settings.dash_css_bg = '#FFF'
              end
              if params[:settings][:dash_css_tc].present?
                settings.dash_css_tc = params[:settings][:dash_css_tc]
              else
                settings.dash_css_tc = '#000'
              end
              if params[:settings][:dash_css_mtc].present?
                settings.dash_css_mtc = params[:settings][:dash_css_mtc]
              else
                settings.dash_css_mtc = '#fff'
              end
              if params[:settings][:dash_css_highlight].present?
                settings.dash_css_highlight = params[:settings][:dash_css_highlight]
              else
                settings.dash_css_highlight = '#F2849E'
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
              if params[:settings][:blog_css_bg].present?
                settings.blog_css_bg = params[:settings][:blog_css_bg]
              end
              if params[:settings][:blog_css_tc].present?
                settings.blog_css_tc = params[:settings][:blog_css_tc]
              end
              if params[:settings][:blog_css_post].present?
                settings.blog_css_post = params[:settings][:blog_css_post]
              end
              if params[:settings][:blog_css_button].present?
                settings.blog_css_button = params[:settings][:blog_css_button]
              end
              if params[:settings][:blog_css_header].present?
                settings.blog_css_header = params[:settings][:blog_css_header]
              end
              if params[:settings][:blog_logo].present?
                settings.blog_logo = params[:settings][:blog_logo]
              end
              if params[:settings][:dash_css_bg].present?
                settings.dash_css_bg = params[:settings][:dash_css_bg]
              end
              if params[:settings][:dash_css_tc].present?
                settings.dash_css_tc = params[:settings][:dash_css_tc]
              end
              if params[:settings][:dash_css_mtc].present?
                settings.dash_css_mtc = params[:settings][:dash_css_mtc]
              end
              if params[:settings][:dash_css_highlight].present?
                settings.dash_css_highlight = params[:settings][:dash_css_highlight]
              end
      end
    if settings.save
      redirect_to settings_path
    end
end
def new
end
end
