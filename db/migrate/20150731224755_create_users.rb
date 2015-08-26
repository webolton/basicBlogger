class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :user_name
      t.string :email
      t.attachment :avatar
      t.string :password_hash
      t.string :password_salt
      t.string :bio
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
