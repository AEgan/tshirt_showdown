class Submission < ActiveRecord::Base
  validates :composite_id, :user_id, :showdown_id, presence: true

  belongs_to :user
  belongs_to :showdown

  def self.extract_composite_id(url)
    url[/[\d\w]+\-[\d\w]+(\-[\d\w]{4})?/]
  end
end
