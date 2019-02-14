Octokit.configure do |c|
  c.client_id = ENV['GITHUB_ID']
  c.client_secret = ENV['GITHUB_SECRET']
end
