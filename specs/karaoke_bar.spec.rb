require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../karaoke_bar')
require_relative('../rooms')
require_relative('../guests')
require_relative('../songs')

class KaraokeBarTest < Minitest::Test

  def setup

    @guest1 = Guest.new("Mark", 10, "Rocketman")
    @guest2 = Guest.new("David", 20, "Purple Rain")
    @guests = [@guest1, @guest2]

    @guest3 = Guest.new("Sam", 3, "Song 2")

    @song1 = Song.new("Angels", "Robbie Williams")
    @song2 = Song.new("Say it ain't so", "Weezer")
    @song3 = Song.new("Rocketman", "Elton John")
    @songs = [@song1, @song2, @song3]
    @false_songs = [@song1, @song2]

    @room1 = Room.new([], @songs)

    @karaoke_bar = KaraokeBar.new("SugarCube", 5, 100, @room1)
  end

  def test_get_bar_name
    assert_equal("SugarCube", @karaoke_bar.name)
  end

  def test_get_entry_amount
    assert_equal(5, @karaoke_bar.entry_cost)
  end

  def test_check_customer_can_afford_entry_cost
    test_value = @karaoke_bar.customer_money_check(@guest1)
    assert_equal(true, test_value)
  end

  def test_check_customer_can_afford_entry_cost_false
    test_value = @karaoke_bar.customer_money_check(@guest3)
    assert_equal(false, test_value)
  end

  def test_increase_till_by_entry
    @karaoke_bar.increase_till_money
    assert_equal(105, @karaoke_bar.till)
  end

  def test_add_get_to_room_once_paid
    @karaoke_bar.put_guest_into_room(@guest1, @room1)
    assert_equal(1, @room1.occupants.length)
  end
end
