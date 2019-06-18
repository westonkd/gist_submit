class OctokitClientProvider
  def self.new_client(user)
    Octokit::Client.new(access_token: user.oauth_token)
  end
end