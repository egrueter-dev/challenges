require 'sinatra'
require 'json'
require 'pry'

roster = File.read('roster.json')
parsed_json = JSON.parse(roster)
teams = parsed_json

positions = []
teams.each do |teams, pos|
   pos.each do |name, place|
     positions << name
  end
end

get '/index' do
  erb :index
end

get '/teams' do
  erb :teams, locals: { team_listy: teams, positions: positions}
end

get '/team/:team' do
  erb :team, locals: { each_team: params["team"], players: teams[params["team"]] }
end

get '/positions' do
  erb :positions, locals: { positions: positions }
end

get '/positions/:position' do
  players_pos = []
  teams.each do |team,player|
    players_pos << [player[params[:position]], team]
  end
  erb :position, locals: { positions: positions, position_player: players_pos, position: params[:position] }
end
