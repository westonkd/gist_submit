class AddCourseIdToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_reference :assignments, :course, foreign_key: true
  end
end
