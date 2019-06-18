module Clients
  class GithubClient
    def initialize(user)
      @client = OctokitClientProvider.new_client(user)
      @client.auto_paginate = true
    end
  end
end