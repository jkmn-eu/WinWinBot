# This is Fletcher, the service in charge of fetching tweets using the Twitter V2 API.
# I'll make it a class
require 'rest-client'

class Fletcher
  def initialize
    @api_key = API_KEY
    @api_secret_key = API_SECRET_KEY
    @bearer_token = BEARER_TOKEN
  end

# this is the query that's being sent to the Twitter API

  def fetch(keywords, query)

    query = "#concours OR #jeuconcours"
    query_params = {
      "query": query,
      "max_results": 75,
      "start_time":
    }
    # 1. make the API call
    RestClient.get()
  end
end
