module Refinery
  module Newsarticles
    class Newsarticle < Refinery::Core::BaseModel
      
      MAX_NEWSARTICLES_IN_MENU = 10
      self.table_name = 'refinery_newsarticles'      

      attr_accessible :refinery_user_id, :headline, :lead, :byline, :photo_id, :story, :event_date, :is_published, :position

      validates :headline, :presence => true, :uniqueness => true
      
      def self.get_pages_in_menu
        # to use this:  Refinery::Newsarticles::Newsarticle.get_pages_in_menu
        Refinery::Newsarticles::Newsarticle.where(:is_published => true).limit(MAX_NEWSARTICLES_IN_MENU)
      end
    end
  end
end
