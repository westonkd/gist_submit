class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :lti_id, null: false
      t.datetime :due_date
      t.string :title
      t.string :lti_course_id
      t.timestamps
    end

    add_index :assignments, :lti_id
    add_index :assignments, :due_date
  end
end
