#Dir['../db/mp3s/*']
require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{@path}/*.mp3")
    #binding.pry
    files.map { |file| file.gsub("#{@path}/","") }
  end

  def import
    self.files.each do |file|
      #binding.pry
      Song.new_by_filename(file)
    end
  end
end
