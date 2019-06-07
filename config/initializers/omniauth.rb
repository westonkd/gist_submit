opts = { scope: 'user:email,gist' }.freeze
github_credentials = Rails.application.credentials.developement[:github]


Rails.application.config.middleware.use OmniAuth::Builder do
  puts github_credentials

  provider :github, github_credentials[:client_id], github_credentials[:client_secret], opts
end