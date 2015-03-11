
require 'sinatra'
configure :development, :test do

require 'pry'
require 'rubygems'
require 'pg'
end

Dir[File.join(File.dirname(__FILE__), 'lib', '**', '*.rb')].each do |file|
  require file
  also_reload file
end


def server_connect
  begin
    connection = PG.connect(dbname:"url_shortener")
    yield(connection)
  ensure
    connection.close
  end
end

enable :sessions

#######################

# GENERATING SHORT URL

#######################

def random_string
  random_string = ('a'..'z').to_a.shuffle.first(4).join
  return random_string
end

def shortened_url(string)
  short_url = "/" + string
  #change this to production url
end

#########################

# DATABASE

#########################

def insert_urls(long_url, short_url)
  server_connect do |conn|
    binding.pry
    conn.exec_params("INSERT INTO urls (long,short) VALUES ($1,$2);", [long_url, short_url])
  end
end

def select_url(conn, short_or_long, long_or_short, ref_url)
  #bring in the "server connect do" code to reduce lines further
  conn.exec_params("SELECT #{short_or_long} from urls WHERE #{long_or_short}= $1;",
    [ref_url])
end

def insert_user(email,password)

end

######################

# CONTROLLERS

######################

get '/' do
  @title = "Welcome to the Link Shortener!"
  short = nil
  long = params.to_a
  if !long.empty?
    long_url = long[0][0]
    server_connect do |conn|
      short = select_url(conn, "short", "long", long_url)
    end
  final_short = short.first["short"]
  end

  # Select all urls from the database with associated userid, and display below.
  # Upon submission send url & associated ID to the db.
  # Final step - JS displays all data.

  erb :index, locals: { short_url: final_short, long_url: long_url }
end

####################

# SIGN UP

####################

get "/sign_up" do
  erb :signup
end

post "/sign_up" do

# Enables session for user.

session[:email] = params["textinput"]
session[:password] = params["passwordinput"]

# Adds new user to db (if one does not already exist, if it does, throw an error
  server_connect do |conn|
    result = conn.exec_params("SELECT users_id FROM users WHERE email = $1", [params]"textinput"]])
    # If sign in does work, redirect to the links page, show links for sign_ins here.
    if result.to_a.empty?
      conn.exec_params("INSERT INTO users (email,password) VALUES ($1,$2)", [params["textinput"], params["passwordinput"]])
      redirect("/")
    end

    # If redirect does not work - display an alert to the user. (Use JS?)

  end
end

####################

# Posting new URL

####################

post "/" do

  long_url = params[:url]
  short_url = shortened_url(random_string)
  insert_urls(long_url,short_url)
  redirect("/?#{long_url}")

end

#####################

# REDIRECT

#####################

get "/:url" do
 url_final = ''
 server_connect do |conn|
   # Refactor to use exec_params (with $1 and array of parameters)
   url_final = conn.exec("SELECT long FROM urls where short='/#{params[:url]}';")
 end
  redirect_url = url_final.first["long"]
  redirect("http://#{redirect_url}")
end
