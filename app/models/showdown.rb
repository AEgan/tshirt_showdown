class Showdown < ActiveRecord::Base

  validates :theme, :end_date, :user_id, presence: true
  
  has_many :submissions
  has_many :votes, through: :submissions
  belongs_to :user

  scope :get_current_user_votes, ->(showdown_id, user_id) {where(id: showdown_id).joins(:votes).where('votes.user_id' => user_id) }

  def over? 
    self.end_date < Date.today()
  end
end
 