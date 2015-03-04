class AddShowdownIdToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :showdown_id, :integer, index: true
  end
end
