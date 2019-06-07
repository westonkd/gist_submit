class AddCredentialsToPlatforms < ActiveRecord::Migration[5.2]
  def change
    add_reference :client_credentials, :platform, foreign_key: true
  end
end
