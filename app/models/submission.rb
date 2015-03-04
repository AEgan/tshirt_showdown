class Submission < ActiveRecord::Base
  validates :composite_id, :user_id, :showdown_id, presence: true
  validates_associated :user

  belongs_to :user
  belongs_to :showdown
end
