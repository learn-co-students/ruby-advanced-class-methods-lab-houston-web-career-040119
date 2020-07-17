class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name_given)
    song = self.new
    song.name = name_given
    song
  end
  
  def self.create_by_name(name_given)
    song = self.new
    song.name = name_given
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      # binding.pry
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
  
  def self.new_from_filename(file_name)
    name_split = file_name.split(" - ")
    artist = name_split[0]
    song_name = name_split[1].gsub(".mp3","")
    
    song = self.new
    song.name = song_name
    song.artist_name = artist
    
    song
    
  end
  
  def self.create_from_filename(file_name)
    name_split = file_name.split(" - ")
    artist = name_split[0]
    song_name = name_split[1].gsub(".mp3","")
    
    song = self.find_or_create_by_name(song_name)
    song.artist_name = artist

    song
  end
    

  def self.destroy_all
    self.all.clear
  end

  
end