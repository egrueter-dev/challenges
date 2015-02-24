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

def random_string
  random_string = ('a'..'z').to_a.shuffle.first(4).join
  return random_string
end

def shortened_url(string)
  short_url = ("/" + string)
  return short_url
end

def original_url(params)
  original = params
  return original
end

def first_long_url
  original_url
end


get '/' do

  @title = "Welcome to the Link Shortener!"
  short = ''
  long_url = first_long_url
  server_connect do |conn|
    short = conn.exec("SELECT short FROM urls WHERE long = '#{long_url}';")
  end
  erb :index, locals: {short_url: short.to_a}
end


post "/" do
  long_url = params[:url]
  original_url(long_url)
  short_url = shortened_url(random_string)
  server_connect do |conn|
    conn.exec_params("INSERT INTO urls (long,short) VALUES ('#{long_url}','#{short_url}');")
  end
  redirect('/')
end

# get "/:url" do
#   server_connect do |conn|
#     #what message would i get from the db?
#     url = conn.exec("SELECT long FROM urls WHERE short = '#{:url}';")
#   end
#   redirect("#{url}")
# end
