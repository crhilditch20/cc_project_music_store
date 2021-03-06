require('pg')
require('pry-byebug')
require_relative('../models/artist')
require_relative('../models/album')
require_relative('../models/genre')

artist1 = Artist.new({
  'name'=>'David Bowie'
  })
artist2 = Artist.new({
  'name'=>'Queen'
  })
artist3 = Artist.new({
  'name'=>'Eurythmics'
  })
artist4 = Artist.new({
  'name'=> 'Michael Jackson'
  })

artist1.save()
artist2.save()
artist3.save()
artist4.save()

genre1 = Genre.new({
  'name'=>'Rock'
  })
genre2 = Genre.new({
  'name'=>'Pop'
  })
genre3 = Genre.new({
  'name'=>'Alternative'
  })
genre4 = Genre.new({
  'name'=>'Electronica'
  })

genre1.save()
genre2.save()
genre3.save()
genre4.save()

album1 = Album.new({
  'title'=>'Blackstar',
  'artist_id'=>artist1.id,
  'quantity'=>13,
  'genre_id'=>genre1.id
  })
album2 = Album.new({
  'title'=>'Greatest Hits',
  'artist_id'=>artist2.id,
  'quantity'=>10,
  'genre_id'=>genre1.id
  })
album3 = Album.new({
  'title'=>'Be Yourself Tonight',
  'artist_id'=>artist3.id,
  'quantity'=>5,
  'genre_id'=>genre3.id
  })
album4 = Album.new({
    'title'=>'Aladdin Sane',
    'artist_id'=>artist1.id,
    'quantity'=>0,
    'genre_id'=>genre1.id
    })
album5 = Album.new({
    'title'=>'Thriller',
    'artist_id'=>artist4.id,
    'quantity'=>12,
    'genre_id'=>genre2.id
    })


album1.save()
album2.save()
album3.save()
album4.save()
album5.save()

# album4.order(5)


binding.pry
nil