# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
require 'json'

Movie.destroy_all

response = URI.parse("https://tmdb.lewagon.com/movie/top_rated")
json = JSON.parse(response.read)

json["results"].each do |movie|
  puts movie["original_title"]
  new_movie = Movie.new
  new_movie.title = movie["original_title"]
  new_movie.overview = movie["overview"]
  new_movie.poster_url = movie["poster_path"]
  new_movie.rating = movie["vote_average"]
  new_movie.save
end
