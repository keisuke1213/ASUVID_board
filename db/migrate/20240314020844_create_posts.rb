class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.datetime :datetime
      t.datetime :deadline
      t.integer :number
      t.string :URL
      t.text :message

      t.timestamps
    end
  end
end
