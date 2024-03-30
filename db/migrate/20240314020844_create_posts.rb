class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :date
      t.datetime :start_time
      t.date :deadline
      t.integer :number
      t.string :URL
      t.text :message
      t.text :content
      t.integer :user_id
      t.timestamps
    end
  end
end
