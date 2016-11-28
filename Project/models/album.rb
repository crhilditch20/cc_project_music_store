require('pg')
require_relative('artist')
require_relative('genre')
require_relative('../db/sql_runner.rb')

class Album

  attr_accessor :title, :artist_id, :quantity, :genre_id, :on_order
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @artist_id = options['artist_id'].to_i
    @quantity = options['quantity'].to_i
    @id = options['id'].to_i
    @genre_id = options['genre_id'].to_i
    @on_order = on_order.to_i
  end

  def save()
    sql = "INSERT INTO albums
    (title, artist_id, quantity, genre_id)
    VALUES
    ('#{@title}', #{@artist_id}, #{@quantity}, #{@genre_id}) RETURNING *;"
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

  def genre()
    sql = "SELECT * FROM genres WHERE id = #{@genre_id};"
    result = SqlRunner.run(sql)
    genre = Genre.new(result[0])
  end

  def stock_check()
    if @quantity > 10
        stock_level = "High"
      elsif @quantity.between?(5,10)
        stock_level = "Medium"
      elsif @quantity.between?(1,4)
        stock_level = "Low"
      elsif @quantity == 0 && @on_order == 0
        stock_level = "Out of stock"
      elsif @quantity == 0 && @on_order != 0
        stock_level = "Awaiting delivery"
    end
    return stock_level
  end

  def order(amount)
    @on_order += amount
    return "#{amount} on order"
  end

  def receive_delivery()
    @quantity += @on_order
    @on_order = 0
    return "Order received"
  end

  def self.update(options)
    sql = "UPDATE albums SET 
    title = '#{options['title']}',
    artist_id = '#{options['artist_id']}',
    quantity = '#{options['quantity']}',
    genre_id = '#{options['genre_id']}'
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