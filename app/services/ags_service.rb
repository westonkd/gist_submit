require 'client_credentials_grant_service'

class AgsService
  def initialize(line_item_url, client_credential)
    @client_credential = client_credential
    @line_item_url = line_item_url
  end

  def create_assignment(assignment_options)
    puts access_token
    sleep 5.minutes
    res = HTTParty.post(
      @line_item_url,
      {
        body: {
          scoreMaximum: assignment_options[:points_possible],
          label: assignment_options[:name],
          'https://canvas.instructure.com/lti/submission_type' => {
            type: 'external_tool',
            external_tool_url: 'http://localhost:3000/messages/resource_link'
          },
        },
        headers: {
          'Authorization' => "Bearer #{access_token}"
        }
      }
    )
    puts res
    puts res.body
    res
  end

  def submit_score(student_id, score, assignment)
    score = Score.find_or_create_by!(
      user: User.by_lti_id(student_id),
      assignment: assignment
    )
    score
  end

  private

  def grant_service
    @_grant_service ||= ClientCredentialsGrantService.new(
      @client_credential.platform.grant_url,
      @client_credential
    )
  end

  def access_token
    @_access_token ||= grant_service.request_token&.dig('access_token')
  end
end
