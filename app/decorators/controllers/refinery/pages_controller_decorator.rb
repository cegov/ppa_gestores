Refinery::PagesController.class_eval do
  
    before_filter :find_newsarticles, :only => "home"
    before_filter :find_courses, :only => "home"
    before_filter :find_pages_for_sidebar_menu
    
    MAX_NEWS_AT_HOME_PAGE = 3
    MAX_COURSES_AT_HOME_PAGE = 3
         
    protected
    
      def find_newsarticles
        @highlight = Refinery::Newsarticles::Newsarticle
          .where(:is_published => true)
          .where(:is_a_highlight => true).first
        @news_for_carousel = Refinery::Newsarticles::Newsarticle.last(5).reverse
      end
      
      def find_courses
        @courses = Refinery::Courses::Course
          .where(:is_active => true)
          .where("photo_id IS NOT NULL")
          .order("position ASC")          
          .limit(MAX_COURSES_AT_HOME_PAGE)
      end
      
      def find_pages_for_sidebar_menu
        @sobre = Refinery::Page.find('sobre')        
      end
end