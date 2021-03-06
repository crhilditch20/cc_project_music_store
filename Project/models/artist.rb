require('pg')
require_relative('album')
require_relative('../db/sql_runner.rb')
require('pry-byebug')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO artists
    (name) VALUES
    ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def delete()
    if albums.length > 0
      return "Albums linked - don't delete!"
    end
    sql = "DELETE FROM artists WHERE id = #{@id};"
    SqlRunner.run(sql)
    return "#{@name} deleted from database"
  end

  def self.update(options)
    sql = "UPDATE artists SET 
    name = '#{options['name']}' 
    WHERE id = '#{options['id']}';"
    SqlRunner.run(sql)
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    result = SqlRunner.run(sql)
    albums = result.map{ |album| Album.new(album)}
    return albums
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    result = SqlRunner.run(sql)
    artists = result.map{ |artist| Artist.new(artist)}
    return artists
  end

  def self.find(id)
      sql = "SELECT * FROM artists WHERE id = #{id};"
      result = SqlRunner.run(sql)
      artist = Artist.new(result[0])
      return artist
  end

end