class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.datetime :start_time, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
