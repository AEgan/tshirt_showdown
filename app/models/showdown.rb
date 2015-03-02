class Showdown < ActiveRecord::Base

  validates :topic, :end_date, presence: true


end
