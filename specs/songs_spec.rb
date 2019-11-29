require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../songs')

class SongTest < Minitest::Test

  def setup
    @song = Song.new("Angels", "Robbie Williams")
  end

  def test_retrieve_song_title
    assert_equal("Angels", @song.title)
  end

  def test_retrieve_song_artist
    assert_equal("Robbie Williams", @song.artist)
  end

end
