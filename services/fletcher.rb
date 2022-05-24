# This is Fletcher, the service in charge of fetching tweets using the Twitter V2 API.
# I'll make it a class
require_relative '../api_keys'
require 'rest-client'
require 'json'
require 'typhoeus'
require 'date'
require 'time'

class Fletcher
  def initialize
    @api_key = API_KEY
    @api_secret_key = API_SECRET_KEY
    @bearer_token = BEARER_TOKEN
    @interval = 3600
    @search_url = "https://api.twitter.com/2/tweets/search/recent"
  end

  # calculating start_time and end_time so that it does not overlap with previous call
  # I'll make a call once an hour so it end_time must be the second the call is made
  # API asks for a date formatted as "2020-07-02T18:00:00Z"

  # interval is a variable so that it allows to be modified later
  # so far set at 3600, being the number of seconds in an hour (60 * 60)




# this is the query that's being sent to the Twitter API

  def fetch(query_params)

    options = {
      method: 'get',
      headers: {
        "User-Agent": "WinWinBot",
        "Authorization": "Bearer #{@bearer_token}"
      },
      params: query_params
    }

    request = Typhoeus::Request.new(@search_url, options)
    response = request.run

    return response

  end


end
