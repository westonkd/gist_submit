class AddUserNametoSubmission < ActiveRecord::Migration[5.2]
  def change
    add_column :submissions, :user_name, :string
  end
end
