class AddClosedToShowdowns < ActiveRecord::Migration
  def change
      add_column :showdowns, :closed, :boolean
  end
end
