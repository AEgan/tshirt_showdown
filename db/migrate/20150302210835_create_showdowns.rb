class CreateShowdowns < ActiveRecord::Migration
  def change
    create_table :showdowns do |t|
      t.string :topic
      t.integer :winning_submission
      t.date :end_date

      t.timestamps null: false
    end
  end
end
