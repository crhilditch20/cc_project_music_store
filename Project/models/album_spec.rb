require('minitest/autorun')
require('minitest/rg')
require_relative('album')


class TestAlbum< Minitest::Test

  def test_order
    album = Album.new({
      'title'=>'Blackstar',
      'artist_id'=>1,
      'quantity'=>13,
      'genre_id'=>1
      })
    result = album.order(10)
    assert_equal("10 ordered", result)
  end

end