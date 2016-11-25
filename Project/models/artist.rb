require('pg')

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
    ('#{@name}' RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def delete()
    album = "SELECT * FROM albums WHERE artist_id = #{@id};"
      return "Album linked - do not delete!" if album != nil
    sql = "DELETE FROM artists WHERE id = #{@id};"
    SqlRunner.run(sql)
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