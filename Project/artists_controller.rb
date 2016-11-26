require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative('models/artist')
require_relative('models/album')

#show all artists in db
get '/artists' do
  @artists = Artist.all()
  erb(:"artists/index")
end

#serve up new artist form
get '/artists/new' do
  erb(:"artists/new")
end