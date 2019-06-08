class CreateClientCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :client_credentials do |t|
      t.string :client_id, null: false
      t.jsonb :private_jwk
      t.jsonb :public_jwk

      t.timestamps
    end

    add_index :client_credentials, :client_id
  end
end
