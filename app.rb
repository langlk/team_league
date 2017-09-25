require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/player')
require('./lib/team')
require('pg')
require "pry"

get('/') do
  @teams = Team.all
  erb(:index)
end

post('/') do
  Team.create({name: params["name"]})
  redirect '/'
end
