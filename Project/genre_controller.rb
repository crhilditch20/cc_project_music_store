require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative('models/artist')
require_relative('models/album')
require_relative('models/genre')

get '/genres' do
  @genres = Genre.all()
  erb(:"genres/index")
end

get '/genres/new' do
  erb(:"genres/new")
end

post '/genres' do
  genre = Genre.new(params)
  genre.save()
  redirect to("/genres")
end

post '/genres/new_album' do
  genre = Genre.new(params)
  genre.save()
  redirect to("/albums/new")
end