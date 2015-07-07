class ProfilesController < ApplicationController
  def show
    @user = Fetcher.new("https://api.github.com/user").to_json
  end
end
