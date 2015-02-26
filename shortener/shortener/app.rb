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

def long_url(params)
  @params = params
end

def long_url_final
  @params
end

get '/' do
  @title = "Welcome to the Link Shortener!"
  short = nil
  # long = long_url_final
  server_connect do |conn|
    short = conn.exec("SELECT short from urls WHERE long='www.google.com';")
  end
  erb :index, locals: { short_url: short.to_a }
end

post "/" do
  long_url = params[:url]
  long_url(long_url)
  short_url = shortened_url(random_string)
  server_connect do |conn|
    conn.exec_params("INSERT INTO urls (long,short) VALUES ('#{long_url}','#{short_url}');")
  end
  redirect('/')
end

# get "/:url" do
#   url_final = ''
#   server_connect do |conn|
    #url_final = conn.exec("SELECT long FROM urls WHERE short = '/#{params["url"]}';")
#   end
#     redirect("#{url_final}")
# end
