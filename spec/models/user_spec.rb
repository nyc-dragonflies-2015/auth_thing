require 'rails_helper'

describe User do
  let (:user) { User.new }
  it "creates when passed no arguments" do
    expect(user.location).to eq "Undefined location"
  end
end
