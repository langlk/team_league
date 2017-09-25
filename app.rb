require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/player')
require('./lib/team')
require('./lib/game')
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

get('/teams/:id/edit') do
  @team = Team.find(params[:id].to_i)
  erb(:team_edit)
end

patch('/teams/:id') do
  team = Team.find(params[:id].to_i)
  team.update({name: params["name"]})
  team.update({coach: params["coach"]})
  redirect "/teams/#{team.id}"
end

delete('/teams/:id') do
  team = Team.find(params[:id].to_i)
  team.delete
  redirect "/"
end

get('/games') do
  @teams = Team.all
  @games = Game.all
  erb(:games)
end

post('/games') do
  Game.create({home_team_id: params["home_team_id"].to_i, away_team_id: params["away_team_id"].to_i, home_team_score: params["home_team_score"].to_i, away_team_score: params["away_team_score"].to_i})
  @teams = Team.all
  @games = Game.all
  erb(:games)
end

get('/games/:id') do
  @game = Game.find(params[:id].to_i)
  erb(:game)
end
