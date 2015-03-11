require 'sinatra'
require 'sinatra/reloader'
require 'pg'

configure :development, :test do
  require 'pry'
end

Dir[File.join(File.dirname(__FILE__), 'lib', '**', '*.rb')].each do |file|
  require file
  also_reload file
end


#########################

# DB Connection methods #

#########################

def server_connect
  begin
    connection = PG.connect(dbname: "movies")
    yield(connection)
  ensure
    connection.close
  end
end

#########################

# Controllers

#########################

get '/' do
  @title = "Hello World"
  erb :index
end

get '/actors' do
  @title = "Actors"
  actors_value = nil

  server_connect do |conn|
    actors_value = conn.exec_params("SELECT actors.name, actors.id FROM actors")
  end

  erb :'actors/actors', locals: { actors: actors_value.to_a }

end

get '/actors/:id' do
  @title = "Actor Name Generated from ID"
  actor_name_actor_id = nil
  movies_starred_in = nil
  server_connect do |conn|
    actor_name_actor_id = conn.exec_params("SELECT actors.name, actors.id FROM actors WHERE actors.id='#{params[:id]}'")
    movies_starred_in = conn.exec_params(
    "
    SELECT movies.title, movies.year, genres.name, actors.name, movies.id AS mid
    FROM cast_members
    JOIN movies
      ON cast_members.movie_id = movies.id
    JOIN actors
      ON cast_members.actor_id = actors.id
    JOIN genres
      ON movies.genre_id = genres.id
    WHERE actors.id='#{params["id"]}';")
  end
  #link to movie details through movie id.
  erb :'actors/id', locals: {movie_title: movies_starred_in.to_a, actor_name: actor_name_actor_id[0]["name"]}
end

get '/movies' do
  movies_data = nil
  genre_information = nil
  server_connect do |conn|
    movies_data = conn.exec_params("SELECT * FROM movies")
    genre_information = conn.exec_params(
    "
    SELECT movies.title, studios.name, genres.name AS genres
    FROM movies
    JOIN genres
      ON genres.id = movies.genre_id
    JOIN studios
      ON movies.studio_id = studios.id;")
  end

  # get studio + genre
  erb :'movies/movies', locals: { movies: movies_data, studio_name: genre_information[0]["name"], genres: genre_information[0]["genres"]  }
end

get '/movies/:id' do
  movies_data = nil
  movie_information = nil
  cast_information = nil
  server_connect do |conn|
    movies_data = conn.exec_params("SELECT * FROM movies WHERE movies.id='#{params["id"]}'")
    movie_information = conn.exec_params(
    "
    SELECT movies.title, studios.name, genres.name AS genres
    FROM movies
    JOIN genres
      ON genres.id = movies.genre_id
    JOIN studios
      ON movies.studio_id = studios.id
    WHERE movies.id=#{params["id"]}")
    cast_information = conn.exec_params(
    "
    SELECT actors.name AS Actors, actors.id AS id
    FROM cast_members
    JOIN actors
      ON cast_members.id = actors.id
    JOIN movies
      ON cast_members.movie_id = movies.id
    WHERE movies.id=#{params["id"]}")
  end
    erb :'movies/id', locals: { movie_title: movies_data.to_a, movie_year: movies_data[0]["year"], studio_name: movie_information[0]["name"], cast_information: cast_information}
end
