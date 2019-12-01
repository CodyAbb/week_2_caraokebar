class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet = 0, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def take_customer_payment(cost)
    @wallet -= cost
  end

  def check_favourite_song(songs)
    song_titles = songs.map { |song| song.title  }
    if song_titles.include? @favourite_song
      return "Whoo!"
    else
      return false 
    end
  end

end
