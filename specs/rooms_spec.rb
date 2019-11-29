require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../rooms')
require_relative('../guests')
require_relative('../songs')

class RoomTest < Minitest::Test

  def setup

    @guest1 = Guest.new("Mark", 10, "Rocketman")
    @guest2 = Guest.new("David", 20, "Purple Rain")
    @guests = [@guest1, @guest2]

    @song1 = Song.new("Angels", "Robbie Williams")
    @song2 = Song.new("Say it ain't so", "Weezer")
    @song3 = Song.new("Rocketman", "Elton John")
    @songs = [@song1, @song2, @song3]
    @false_songs = [@song1, @song2]

    @room = Room.new(@guests, @songs)
  end

  def test_num_of_guests_in_room
    @room.add_guest_to_room(@guest1)
    @room.add_guest_to_room(@guest3)
    assert_equal(2, @room.occupants.length)
  end

  def test_num_of_songs_in_playlist
    @room.add_songs_to_playlist(@songs)
    assert_equal(3, @room.playlist.length)
  end

end
