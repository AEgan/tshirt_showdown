class Showdown < ActiveRecord::Base

  validates :theme, :end_date, presence: true


end
