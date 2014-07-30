require 'oauth'
require 'json'
require 'pp'
require 'csv'
require 'YAML'

def fullPath( relpath )
  File.expand_path( File.join(File.dirname(__FILE__), relpath) )
end

def get_access_token ()
	yelp_config = YAML.load_file(fullPath('/yelp.yml' ))
	credentials = yelp_config["credentials"]
	api_host = 'api.yelp.com'
	consumer = OAuth::Consumer.new(credentials["consumer_key"], credentials["consumer_secret"], {:site => "http://#{api_host}"})
	access_token = OAuth::AccessToken.new(consumer, credentials["token"], credentials["token_secret"])

	return access_token
end

def get_search_count (term, location)
	path = "/v2/search?term=#{term}&location=#{location}"
	access_token = get_access_token()
	result = JSON.parse(access_token.get(path).body)
	count = result["total"]
end

count = get_search_count( ARGV[0], ARGV[1] )

pp "The Number of #{ARGV[0]} in #{ARGV[1]} is: #{count}"