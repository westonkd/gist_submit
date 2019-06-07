class CreatePlatforms < ActiveRecord::Migration[5.2]
  def change
    create_table :platforms do |t|
      t.string :public_key_uri, null: false
      t.string :authorization_uri, null: false
      t.string :iss, null: false

      t.timestamps
    end
  end
end
