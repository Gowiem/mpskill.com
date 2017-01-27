#!/bin/ruby
require 'sinatra'
require 'redis'
require 'json'

redis = Redis.new(host: 'mountain-proj.5vy0kj.0001.use1.cache.amazonaws.com',
                  port: 6379)

# - Invoked from the submission of website form. Has user's email as input.
# - Generates 4 character pairing ID.
# - Creates the Pairing ID => User email key for the finalize intent.
post '/start_pair' do
  email = params['email']
  pairing_id = 4.times.map { rand(10) }.join

  redis.set("pairing_#{pairing_id}", email)

  content_type :json
  { pairing_id: pairing_id }.to_json
end
