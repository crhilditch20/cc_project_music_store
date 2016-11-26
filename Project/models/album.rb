require('pg')
require_relative('artist')
require_relative('../db/sql_runner.rb')

class Album

  attr_accessor :title, :artist_id, :quantity
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @artist_id = options['artist_id'].to_i
    @quantity = options['quantity'].to_i
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    (title, artist_id, quantity)
    VALUES
    ('#{@title}', #{@artist_id}, #{@quantity}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    result = SqlRunner.run(sql)
    artist = Artist.new(result[0])
  end

  def self.update(options)
    sql = "UPDATE albums SET 
    title = '#{options['title']}',
    artist_id = '#{options['artist_id']}',
    quantity = '#{options['quantity']}'
    WHERE id = '#{options['id']}';"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    result = SqlRunner.run(sql)
    albums = result.map{ |album| Album.new(album)}
    return albums
  end

  def self.find(id)
      sql = "SELECT * FROM albums WHERE id = #{id};"
      result = SqlRunner.run(sql)
      album = Album.new(result[0])
      return album
  end

end