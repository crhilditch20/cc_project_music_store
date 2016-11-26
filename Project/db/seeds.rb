require('pg')
require('pry-byebug')
require_relative('../models/artist')
require_relative('../models/album')

artist1 = Artist.new({
  'name'=>'David Bowie',
  })

artist2 = Artist.new({
  'name'=>'Queen',
  })

artist3 = Artist.new({
  'name'=>'Eurythmics',
  })

artist1.save()
artist2.save()
artist3.save()

album1 = Album.new({
  'title'=>'Blackstar',
  'artist_id'=>artist1.id,
  'quantity'=>13
  })

album2 = Album.new({
  'title'=>'The Works',
  'artist_id'=>artist2.id,
  'quantity'=>10
  })

album3 = Album.new({
  'title'=>'Be Yourself Tonight',
  'artist_id'=>artist3.id,
  'quantity'=>5
  })

album4 = Album.new({
    'title'=>'Aladdin Sane',
    'artist_id'=>artist1.id,
    'quantity'=>4
    })

album1.save()
album2.save()
album3.save()
album4.save()


binding.pry
nil