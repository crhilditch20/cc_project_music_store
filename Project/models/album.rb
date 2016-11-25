require('pg')

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
    ('#{@title}', #{@artist_id}, #{@quantity} RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

end