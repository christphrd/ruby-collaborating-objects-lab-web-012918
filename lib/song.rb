require "pry"

class Song
  attr_accessor :artist, :name

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    new_song_name = file.split(" - ")[1]
    artist_name = file.split(" - ")[0]
    new_song_instance = self.new(new_song_name)
    new_song_instance.artist = Artist.find_or_create_by_name(artist_name)
    #binding.pry
    new_song_instance.artist.add_song(new_song_instance)
    #binding.pry
    new_song_instance
  end
end
