class RemoveWinningSubmissionFromShowdown < ActiveRecord::Migration
  def change
    remove_column :showdowns, :winning_submission
  end
end
