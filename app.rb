require_relative 'services/fletcher'
require 'json'

# This is the base file for the app, where it will be launched from.

# Since it's a microservices architecture, I'll call every element here

# 1. Call fletcher, the service in charge of collecting tweets

puts "Calling a Fletcher instance"
fletcher = Fletcher.new
puts "Fletcher Instance was created and is now running"

puts "Test running"
puts "------------------------------------"
puts "defining the end and start time for the request"

# timeframe until which the fetch is set for

raw_end_time = Time.now - 20

end_time = raw_end_time.utc.iso8601

# timeframe from where the start the fetch (-1 hour, ergo 3600 (+ 20 seconds for the interval), from end_date)
start_time = (raw_end_time - 3620).utc.iso8601

puts "defining the params for the request"

query = "#concours OR #jeuconcours"

query_params = {
  "query": query,
  "max_results": 75,
  "start_time": start_time,
  "end_time": end_time,
  "tweet.fields": "attachments,author_id,conversation_id,created_at,id,lang"
}

puts "calling for fetch function of Fletcher"
puts "fletcher function was called"
# Calling Fletcher's method #fetch so that it fetches results
results = fletcher.fetch(query_params)
# These results need to be passed to a builder to be extracted and passed on the next step
results = JSON.parse(results.body)
# results are actually stored inside a Hash, itself containing a data key, which value is a collection of hashes
# from there I can iterate on the elements and collect their contents.
puts results.class
results["data"].each do |result|
  puts result
  puts result.class
end

puts "results were sent and displayed"
