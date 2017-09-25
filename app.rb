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
  Team.create({name: params["name"], coach: params["coach"]})
  redirect '/'
end

get('/teams/:id') do
  @team = Team.find(params[:id].to_i)
  erb(:team)
end

post('/teams/:id') do
  team = Team.find(params[:id].to_i)
  Player.create({name: params["name"], team_id: team.id})
  redirect "/teams/#{team.id}"
end

get('/players/:id') do
  @player = Player.find(params[:id].to_i)
  erb(:player)
end

get('/players/:id/edit') do
  @player = Player.find(params[:id].to_i)
  erb(:player_edit)
end

patch('/players/:id') do
  player = Player.find(params[:id].to_i)
  player.update({name: params["name"]})
  redirect "players/#{player.id}"
end

delete('/players/:id') do
  player = Player.find(params[:id].to_i)
  team_id = player.team_id
  player.delete
  redirect "teams/#{team_id}"
end
