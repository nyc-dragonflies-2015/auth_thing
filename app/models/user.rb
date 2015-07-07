class User
  attr_reader :location, :repos

  def self.find(username)
    self.new(location: Fetcher.new("https://api.github.com/user").to_json["location"],
             repos: Fetcher.new("https://api.github.com/user/repos").to_json.map{|json_repo| json_repo["name"]}.sort
            )
  end

  def initialize(args={})
    @location = args.fetch(:location, "Undefined location")
    @repos = (args.fetch:repos, [])
  end
end
