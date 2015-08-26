class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :body
      t.integer :status
      t.string :parent_id

      t.timestamps null: false
    end
  end
end
