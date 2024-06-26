class CreateExpressions < ActiveRecord::Migration[6.1]
  def change
    create_table :expressions do |t|
      t.string :title
      t.string :type
      t.text :content
      t.text :message
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
