require_relative('../db/sql_runner')
class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO albums
    (title,
     genre,
     artist_id)
     values
     ($1, $2, $3)
     RETURNING id"
     values = [@title, @genre, @artist_id]
     @id = SqlRunner.run(sql, values)[0]['id'].to_i
   end

   def self.delete_all()
     sql = "DELETE FROM albums"
     SqlRunner.run(sql)
   end

   def delete()
     sql = "DELETE FROM albums WHERE id = $1"
     values = [@id]
     SqlRunner.run(sql, values)
   end

   def update()
     sql = "UPDATE albums SET(
       title,
       genre,
       artist_id
     ) =
     ($1, $2, $3)
     WHERE id = $4"
     values = [@title, @genre, @artist_id]
     SqlRunner(sql, values)
   end

   def self.find(id)
     sql = "SELECT * FROM albums WHERE id = $1"
     values = [id]
     albums = SqlRunner.run(sql, values)
     album_hash = albums[0]
     album = Album.new(album_hash)
     return album
   end

   def artist()
     sql = "SELECT * FROM artists WHERE id = $1"
     values = [@artist_id]
     results = SqlRunner.run(sql, values)[0]
     artists = Artist.new(results)
     return artists
   end
end