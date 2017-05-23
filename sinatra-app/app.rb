require 'sinatra'
require 'redis'
require 'json'

set :bind, '0.0.0.0'
set :protection, :except => [:json_csrf]

redis = Redis.new(host: 'redis.mpskill.com',
                  port: 6379)

get '/' do
  content_type :json
  { status: 'up' }.to_json
end

# - Invoked from the submission of website form. Has user's email as input.
# - Generates 4 character pairing ID.
# - Creates the Pairing ID => User email key for the finalize intent.
# NOTE: GET action due to a bug in Window/IE that I don't have the time or patience to deal with.
get '/start_pair' do
  email = params['email']
  pairing_id = 4.times.map { rand(10) }.join

  key = "pairing_#{pairing_id}"
  redis.set(key, email)
  redis.expire(key, 600) # 10 minute ttl

  response.headers['Access-Control-Allow-Origin'] = 'https://mpskill.com'

  content_type :json
  { pairing_id: pairing_id }.to_json
end
