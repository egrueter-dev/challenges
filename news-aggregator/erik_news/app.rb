require 'sinatra'
require 'pry'
require 'csv'

get '/articles' do
  rows = []
  news = CSV.read("./articles.csv")
  news.each do |row|
    rows << row
  end
  erb :index, locals: { rows: rows }
end


get '/articles/new' do
  erb :new
end

post '/articles' do
  title = params["title"]
  url = params["url"]
  description = params["description"]

  CSV.open('./articles.csv','a') do |csv|
    csv << [title,url,description]
  end
  redirect '/articles'
end
