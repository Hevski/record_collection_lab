require('pry')
require_relative('../models/album')
require_relative('../models/artist')

Album.delete_all()
Artist.delete_all()


artist1 = Artist.new({'name' => 'Jurassic 5'})
artist1.save()

artist2 = Artist.new({'name' => 'Travis'})
artist2.save()

artist1.name = "The Who"
artist1.update()

album1 = Album.new({
  'title' => 'J5',
  'genre' => "hmmm",
  'artist_id' => artist1.id
  })
album1.save()

album2 = Album.new({
  'title' => 'Good Feeling',
  'genre' => 'rock',
  'artist_id' => artist2.id
  })
  album2.save()

album3 = Album.new({
  'title' => 'The Man Who',
  'genre' => 'rock',
  'artist_id' => artist2.id
  })
  album3.save()

binding.pry
nil

#found_artist = Artist.find(album1.artist.id)
