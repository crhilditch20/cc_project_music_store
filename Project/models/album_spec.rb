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
    assert_equal("10 on order", result)
  end

  def test_receive_delivery
    album = Album.new({
      'title'=>'Blackstar',
      'artist_id'=>1,
      'quantity'=>13,
      'genre_id'=>1
      })
    album.order(10)
    album.receive_delivery
    assert_equal(23, album.quantity)
    assert_equal(0, album.on_order)
  end

  def test_stock_check
    album = Album.new({
      'title'=>'Blackstar',
      'artist_id'=>1,
      'quantity'=>0,
      'genre_id'=>1,
      'on_order'=>10
      })
    result = album.stock_check
    assert_equal("Awaiting delivery", result)
  end

end