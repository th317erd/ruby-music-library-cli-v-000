class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(artist_name)
    artist = Artist.new(artist_name)
    @@all << artist
    artist
  end

  def add_song(name)
    if name.artist != self
      # binding.pry
      name.artist = self
    end
    if self.songs.include?(name)
    else
      @songs << name
    end
  end

  def genres
    something = @songs.collect {|x| x.genre}
    something.uniq
  end
end
