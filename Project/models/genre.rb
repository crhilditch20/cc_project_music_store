require('pg')
require_relative('album')
require_relative('../db/sql_runner.rb')

class Genre

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO genres
    (name) VALUES
    ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE genre_id = #{@id};"
    result = SqlRunner.run(sql)
    albums = result.map {|album| Album.new(album)}
    return albums
  end

  def self.all()
    sql = "SELECT * FROM genres;"
    result = SqlRunner.run(sql)
    genres = result.map{ |genre| Genre.new(genre)}
    return genres
  end



end