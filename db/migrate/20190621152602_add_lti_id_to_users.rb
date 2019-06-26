class AddLtiIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lti_id, :string
  end
end
