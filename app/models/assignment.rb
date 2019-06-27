class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :scores

  def self.line_item_url_for_course(course_id)
    "http://canvas.docker/api/lti/courses/1/line_items"
  end
end
