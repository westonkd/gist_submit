class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :avatar_url, null: false
      t.string :email, null: false
      t.string :uid, null: false
      t.string :provider, null: false
      t.string :oauth_token
      t.boolean :is_admin

      t.timestamps
    end

    add_index :users, :uid
    add_index :users, :email
    add_index :users, :username
  end
end
