require 'client_credentials_grant_service'

class AgsService
  def initialize(line_item_url, client_credential)
    @client_credential = client_credential
    @line_item_url = line_item_url
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
      client_credential.platform.grant_url,
      client_credential
    )
  end
end