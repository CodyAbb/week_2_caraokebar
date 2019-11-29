require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../guests')
require_relative('../songs')

class GuestsTest < Minitest::Test

  def setup
    @guest = Guest.new("Mark", 10, "Rocketman")

    @song1 = Song.new("Angels", "Robbie Williams")
    @song2 = Song.new("Say it ain't so", "Weezer")
    @song3 = Song.new("Rocketman", "Elton John")
    @songs = [@song1, @song2, @song3]
    @false_songs = [@song1, @song2]

  end

  def test_get_guest_name
    assert_equal("Mark", @guest.name)
  end

  def test_get_customer_wallet_amount
    assert_equal(10, @guest.wallet)
  end

  def test_reduce_customer_wallet
    @guest.take_customer_payment(4)
    assert_equal(6, @guest.wallet)
  end

  def test_return_true_matching_favourite_song
    assert_equal(true, @guest.check_favourite_song(@songs))
  end

  def test_return_false_matching_favourite_song
    assert_equal(false, @guest.check_favourite_song(@false_songs))
  end

end
