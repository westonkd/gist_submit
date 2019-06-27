class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :lti_id
      t.string :title

      t.timestamps
    end
  end
end
