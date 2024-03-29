class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :scores
  has_many :submissions

  def self.line_item_url_for_course(course_id)
    "http://canvas.docker/api/lti/courses/#{course_id}/line_items"
  end
end
