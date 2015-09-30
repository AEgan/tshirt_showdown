class AddDescriptionToShowdowns < ActiveRecord::Migration
  def change
    add_column :showdowns, :description, :string
  end
end
