class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = ""
    @artist_name = ""
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(new_name)
    new_song = Song.new
    new_song.name = new_name
    new_song
  end

  def self.create_by_name(new_name)
    new_song = Song.new_by_name(new_name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

 
  def self.alphabetical
    @@all.sort! { |a, b|  a.name <=> b.name }
  end

  def self.new_from_filename(file_name)
    delimiters = [' - ','.mp3']
    arr = file_name.split(Regexp.union(delimiters))
    new_song = Song.new
    new_song.name = arr[1]
    new_song.artist_name = arr[0]
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = Song.new_from_filename(file_name)
    @@all << new_song
  end

  def self.destroy_all
    @@all = []
  end

end