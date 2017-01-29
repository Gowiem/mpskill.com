require 'sinatra'
require 'redis'
require 'json'

set :bind, '0.0.0.0'

redis = Redis.new(host: 'mountain-proj.5vy0kj.0001.use1.cache.amazonaws.com',
                  port: 6379)

get '/' do
  content_type :json
  { status: 'up' }.to_json
end

# - Invoked from the submission of website form. Has user's email as input.
# - Generates 4 character pairing ID.
# - Creates the Pairing ID => User email key for the finalize intent.
post '/start_pair' do
  email = params['email']
  pairing_id = 4.times.map { rand(10) }.join

  redis.set("pairing_#{pairing_id}", email)

  response.headers['Access-Control-Allow-Origin'] = 'https://mpskill.com'

  content_type :json
  { pairing_id: pairing_id }.to_json
end
