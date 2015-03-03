class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :composite_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
