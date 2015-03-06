class Vote < ActiveRecord::Base
  validates :user_id, :submission_id, presence: true
  belongs_to :user
  belongs_to :submission 
end
