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



binding.pry
nil