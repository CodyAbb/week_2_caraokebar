require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../karaoke_bar')
require_relative('../rooms')
require_relative('../guests')
require_relative('../songs')

class KaraokeBarTest < Minitest::Test

  

end
