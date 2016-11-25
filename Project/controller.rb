require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative('models/artist')
require_relative('models/album')

#show inventory page
get '/albums' do
  @albums = Album.all()
  erb(:index)
end

#serve up new album form
get '/albums/new' do
  @artists = Artist.all()
  erb(:new)
end

#add new album to db
post '/albums' do
  album = Album.new(params)
  album.save()
  redirect to("/albums")
end

#serve form to edit album
get '/albums/:id/edit' do
  @album = Album.find(params[:id])
  @artists = Artist.all()
  erb(:edit)
end


