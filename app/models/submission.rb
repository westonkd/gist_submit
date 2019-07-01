class Submission < ApplicationRecord
  belongs_to :assignment
  belongs_to :user

  def self.from_url(url, lti_user_id, lti_assignment_id)
    user = User.find_by!(lti_id: lti_user_id)
    assignment = Assignment.find_by!(lti_id: lti_assignment_id)

    Submission.where(user: user, assignment: assignment).destroy_all

    Submission.create!(
      url: url,
      user: user,
      content: gist_body(url),
      assignment: assignment,
      user_name: user.username
    )
  end

  def self.gist_body(url)
    gist = JSON.parse(HTTParty.get(url).body)
    file_key = gist['files'].first.first
    raw_url = gist.dig('files', file_key, 'raw_url')
    HTTParty.get(raw_url).body
  end
end
