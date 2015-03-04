class Showdown < ActiveRecord::Base

  validates :theme, :end_date, :user_id, presence: true
  validates_associated :user
  
  has_many :submissions
  belongs_to :user

end
