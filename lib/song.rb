
class Song
  attr_accessor :name, :artist_name
  attr_reader :song_names
  @@all = []

  def self.all
    @@all
  end

  def self.create
    @@all << self.new
    @@all[-1]
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.all_songs
    self.all.map do |song|
      song.name
    end
  end

  def self.alphabetical
    self.all_songs.sort.map do |song_name|
      self.all.find do |song|
        song.name == song_name
      end
    end
  end

  def songname_from_filename(filename)
    filename.split(" - ")[1][0..-5]
  end
  def artistname_from_filename(filename)
    filename.split(" - ")[0]
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = song.songname_from_filename(filename)
    song.artist_name = song.artistname_from_filename(filename)
    song
  end

  def self.create_from_filename(filename)
    song = self.create
    song.artist_name = song.artistname_from_filename(filename)
    song.name = song.songname_from_filename(filename)
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
