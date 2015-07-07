class Fetcher
  GH_PAT = Rails.application.secrets.gh_pat

  def initialize(uri)
    @uri = URI(uri)
  end

  def to_json
    JSON.parse(response.body)
  end

  private

    def http_agent
      agent = Net::HTTP.new(host, port)
      agent.use_ssl = true
      agent
    end

    def host
      @uri.host
    end

    def port
      @uri.port
    end

    def headers
      { "Authorization" => "token #{GH_PAT}" }
    end

    def request_uri
      @uri.request_uri
    end

    def request
      Net::HTTP::Get.new(request_uri, headers)
    end

    def response
      http_agent.request(request)
    end
end

