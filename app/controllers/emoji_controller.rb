class EmojiController < ApplicationController
  def index
    @pairs = EmojiFetcher.new.emoji_pairs
  end
end
