class Room

  attr_reader :occupants, :playlist

  def initialize(occupants, playlist)
    @occupants = []
    @playlist = []
  end

  def add_guest_to_room(guest)
    @occupants.concat(guest)
  end

  def add_songs_to_playlist(song)
    @playlist.concat(song)
  end

end
