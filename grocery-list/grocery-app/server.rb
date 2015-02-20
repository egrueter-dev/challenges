require 'sinatra'
require 'pry'
set :views, Proc.new { File.join(root) }

get '/groceries' do
  gs = File.read("grocery_list.txt")
  g = gs.split(" ")
  groceries = g
  erb :view, locals: { groceries: groceries }
end

post '/groceries' do
  item = params[:item]
  File.open("grocery_list.txt", "a") do |f|
    f.write("#{item}\n")
  end
  redirect to('/groceries')
end
