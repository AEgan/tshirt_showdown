class RenameTopicInShowdowns < ActiveRecord::Migration
  def change
    rename_column :showdowns, :topic, :theme
  end
end
