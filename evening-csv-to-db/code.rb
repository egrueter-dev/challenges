require 'pg'
require 'csv'
require 'pry'

def server_connect
  connection = PG.connect(dbname: "ingred")
end

def open_csv
  file = CSV.open("./ingredients.csv")
end

def adding_values
  open_csv.each do |num,ingred|
     server_connect.exec_params("INSERT INTO ingred (count, ingredient) VALUES ('#{num.to_i}','#{ingred}');")
  end
end

def draw_on_results
  results = server_connect.exec("SELECT count,ingredient FROM ingred")
  results.each do |count,ingredient|
      puts "#{count["count"]}. #{count["ingredient"]}"
  end
end

draw_on_results
