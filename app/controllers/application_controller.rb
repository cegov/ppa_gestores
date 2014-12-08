class ApplicationController < ActionController::Base
  protect_from_forgery except: :verify_user
  before_filter :get_courses
  
  helper_method :refinery_user?
  
  
  def verify_user
    username = params['refinery_user']['username']
    password = params['refinery_user']['password']
    user = Refinery::User.find_by_username(username)
    if !user.nil? and  user.valid_password?(password)
      head :ok
    else 
      head :bad_request
    end
  end
  
  def get_sitemap
    @page = nil # ::Refinery::Page.where(:link_url => "/newsarticles").first # gambiarra para definir o template usado
    @newsarticles = Refinery::Newsarticles::Newsarticle.get_published.last(30)
    @courses_for_sitemap = Refinery::Courses::Course.where(:is_active => true)
    @pages = Refinery::Page.where show_in_menu: true    
    respond_to do |format|
      format.html {       
        render "sitemap/sitemap", layout: true
      }
      format.xml { render "sitemap/index.xml" }
    end        
  end
  
  def get_courses
    @courses = Refinery::Courses::Course
          .where(:is_active => true)
          .where("photo_id IS NOT NULL")
          .order("position ASC")          
          .limit(MAX_COURSES_AT_HOME_PAGE) 
  end
  
end
