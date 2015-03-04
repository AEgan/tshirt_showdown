class Showdown < ActiveRecord::Base

  validates :theme, :end_date, :user_id, presence: true
  
  has_many :submissions
  belongs_to :user

end
