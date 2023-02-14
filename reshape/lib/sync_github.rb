class SyncGithub
  def self.run!
    raise("REPO_FULL_NAME env missing, please set it") if ENV["REPO_FULL_NAME"].blank?
    
    puts "👉 Sync repo info #{ENV['REPO_FULL_NAME']}"
    FetchRepo.new(ENV["REPO_FULL_NAME"]).run 

    puts "👇 Sync Issues"
    FetchIssues.new(ENV["REPO_FULL_NAME"]).run

    puts "👇 Sync PullRequests"
    FetchPullRequests.new(ENV["REPO_FULL_NAME"]).run

    puts "👇 Sync Forks"
    FetchForks.new(ENV["REPO_FULL_NAME"]).run

    puts "👇 Sync Stars"
    FetchStars.new(ENV["REPO_FULL_NAME"]).run

    puts "👇 Sync Region"
    SyncStars.new.run
  end
end