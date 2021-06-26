class Artist 
  attr_accessor :name 
  
  @@all = []
  
    def initialize(name) #accepts a name for the artist
      @name = name #sets the artist name
      @@all << self
    end
    
    def self.all #returns all existing Artist instances
      @@all
    end
    
    def save
      @@all
    end
    
    def add_song(song) #keeps track of an artist's songs
      song.artist = self
    end
    
    def songs 
      Song.all.select {|song| song.artist == self}
    end
    
    def self.find_or_create_by_name(artist_name)
      found_artist = self.all.find {|artist| artist.name == artist_name}
     if found_artist
        found_artist
      else
        new_artist = self.new(artist_name)
        new_artist.save
        new_artist
      end
    end
    
    def print_songs
      songs.each do |song|
        puts song.name
      end
    end
    
end