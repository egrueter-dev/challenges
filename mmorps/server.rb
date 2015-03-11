require "sinatra"
require "uri"
require "openssl"
require "pry"

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}

enable :sessions

get '/' do
  @title = "Would You Like to Play A Game?"
  erb :index
end

def reset_number
  session[:scores][:comp_score] = 0
  session[:scores][:player] = 0
end

post '/newgame' do
  redirect("/newgame?#{params["guess"]}")
end

def scores_calculator(player,computer)

  session[:scores][:player] += player
  session[:scores][:comp_score] += computer

  if session[:scores][:player] > 3
    session[:alert] = "Player Wins with #{session[:scores][:player]}"
    reset_number

  elsif session[:scores][:comp_score] > 3
    session[:alert] = "Comp Wins with #{session[:scores][:comp_score]}"
    reset_number
  else
    session[:alert] = nil
  end
end

get '/newgame' do

  player_s = ""

  if !params.empty?
    player_score = params.first.first
    player_s = player_score.to_sym
  end
  if player_s != :r || player_s != :s || player_s != :p
    session[:alert] = "Invalid"
  end
  player = { "player" => 0, "comput" => 0 }
  defeats = { :r => :p, :p => :s, :s => :r }
  computer_s = defeats.keys.sample

  output = nil
  not_valid = nil

  if computer_s == defeats[player_s]
    player["comput"] += 1

  elsif player_s == defeats[computer_s]
    player["player"] += 1

  else computer_s == player_s
    output = "tie"
  end

  scores_calculator(player["player"], player["comput"])

  erb :new, locals: { player_score: session[:scores][:player], comp_score: session[:scores][:comp_score], tie: output, session_alert: session[:alert], not_valid: not_valid }

end
