Refinery::PagesController.class_eval do
  
    before_filter :find_all_newsarticles
  
    protected
    
      def find_all_newsarticles
        @newsarticles = Refinery::Newsarticles::Newsarticle.where(:is_published => true)        
      end
end