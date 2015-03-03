class AddRelationToShowdown < ActiveRecord::Migration
  def change
    add_column :showdowns, :user_id, :integer, index: true
  end
end
