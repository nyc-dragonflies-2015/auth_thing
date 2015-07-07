class ProfileController < ApplicationController
  def show
    @user = Fetcher.new("https://api.github.com/user").to_json
    @repos = Fetcher.new("https://api.github.com/user/repos").to_json.map{|json_repo| json_repo["name"]}.sort
  end
end
