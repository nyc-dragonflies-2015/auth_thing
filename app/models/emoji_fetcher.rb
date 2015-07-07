class EmojiFetcher < Fetcher
  EMOJI_URI = URI('https://api.github.com/emojis')

  def initialize(*args)
    @uri = URI(EMOJI_URI)
  end

  def emoji_pairs
    JSON.parse(response.body)
  end
end
