require 'sinatra'
require 'pry'
require 'pg'

def server_connect
  begin
    connection = PG.connect(dbname:"news_aggregator_development")
    yield(connection)
  ensure
    connection.close
  end
end

get '/articles' do
  article_data = nil

  server_connect do |conn|
    article_data = conn.exec("SELECT name,url,description FROM articles" )
  end

  erb :index, locals: {article_data: article_data.to_a}
end

get '/articles/new' do

  erb :new
end

post '/articles' do

  title = params["title"]
  url = params["url"]
  description = params["description"]

  server_connect do |conn|
    conn.exec_params("INSERT INTO public.articles (name,url,description) VALUES ('#{title}','#{url}','#{description}');")
  end

  redirect '/articles'
end
