require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative('album_controller.rb')
require_relative('artists_controller.rb')
require_relative('genre_controller.rb')

get '/' do
  erb(:index)
end