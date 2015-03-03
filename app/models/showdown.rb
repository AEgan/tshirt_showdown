class Showdown < ActiveRecord::Base

  validates :theme, :end_date, :user_id, presence: true
  validates_associated :user
  belongs_to :user

end
