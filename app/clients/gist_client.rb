require_relative './github_client'

module Clients
  class GistClient < GithubClient
    def index
      @client.gists
    end
  end
end