class UpdateDescriptionOnShowdowns < ActiveRecord::Migration
  def change
    change_column :showdowns, :description, :text
  end
end
