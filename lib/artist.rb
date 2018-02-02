require 'pry'

class Artist
  attr_accessor :name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end


  def add_song(song)
    @songs << song
    song.artist = self
  end

  def save
    @@all << self
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

  def self.find_or_create_by_name(artist_name)
    found_artist = @@all.find do |artist_instance|
      artist_instance.name == artist_name
    end
    if found_artist
      found_artist
    else
      new_artist_instance = self.new(artist_name)
      new_artist_instance.save
      new_artist_instance
    end
  end
end
