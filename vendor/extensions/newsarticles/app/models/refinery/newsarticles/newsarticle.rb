module Refinery
  module Newsarticles
    class Newsarticle < Refinery::Core::BaseModel
      self.table_name = 'refinery_newsarticles'

      attr_accessible :refinery_user_id, :headline, :lead, :byline, :photo_id, :story, :event_date, :is_published, :position

      validates :headline, :presence => true, :uniqueness => true
    end
  end
end
