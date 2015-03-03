class ChangeColumnDefaultOnShowdowns < ActiveRecord::Migration
  def change
    change_column_default :showdowns, :closed, :false
  end
end
