class Submission < ActiveRecord::Base
 
  COMPOSITE_ID_CHECK = /[\d\w]+\-[\d\w]+(\-[\d\w]{4})?/
  #COMPOSITE_ID_VALIDATOR = 
  validates :composite_id, :user_id, :showdown_id, presence: true
  #validates :composite_id, format: COMPOSITE_ID_CHECK 

  has_many :votes
  belongs_to :user
  belongs_to :showdown

 

  def self.extract_composite_id(url)
    url[COMPOSITE_ID_CHECK]
  end
end
