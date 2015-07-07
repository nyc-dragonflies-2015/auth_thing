class EmojiFetcher
  EMOJI_URI = URI('https://api.github.com/emojis')
  GH_PAT = Rails.application.secrets.gh_pat

  def emoji_pairs
    JSON.parse(response.body)
  end

  private

    def http_agent
      agent = Net::HTTP.new(host, port)
      agent.use_ssl = true
      agent
    end

    def host
      EMOJI_URI.host
    end

    def port
      EMOJI_URI.port
    end

    def headers
      { "Authorization" => "token #{GH_PAT}" }
    end

    def request_uri
      EMOJI_URI.request_uri
    end

    def request
      Net::HTTP::Get.new(request_uri, headers)
    end

    def response
      http_agent.request(request)
    end
end
