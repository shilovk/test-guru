# frozen_string_literal: true

# GitHubClient
class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  CLIENT_ID = ENV['GITHUB_CLIENT_ID']
  CLIENT_SECRET = ENV['GITHUB_CLIENT_SECRET']
  GIST_ACCESS_TOKEN = ENV['GIST_ACCESS_TOKEN']

  def initialize
    @client = setup_client
  end

  def create_gist(params)
    @client.create_gist params
  end

  private

  def setup_client
    Octokit::Client.new access_token: GIST_ACCESS_TOKEN
    # Octokit::Client.new \
    #   client_id: CLIENT_ID,
    #   client_secret: CLIENT_SECRET
  end
end
