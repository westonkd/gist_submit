class IndexCourseOnLtiId < ActiveRecord::Migration[5.2]
  def change
    add_index :courses, :lti_id
  end
end
