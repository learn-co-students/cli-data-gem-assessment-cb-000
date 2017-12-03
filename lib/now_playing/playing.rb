# I'm designing this around the Fandango site, so I can pull movie info by name (title),
# times, locations, and other data that will help users make an informed decision

class NowPlaying::Playing
  attr_accessor :name, :price, :theater, :url

  def self.today
    # Will pull movies playing today
    #puts <<-DOC.gsub /^\s*/, ''
      #Coco
      #Wonder
      #Justice League
      #Thor: Ragnarok
      #Wind River
      #The Disaster Artist
    ##DOC

    movie_1 = self.new
    movie_1.name = "Coco"
    movie_1.theater = "Fairview Twin"
    movie_1.url = "https://www.fandango.com/coco-2017-185799/movie-overview"

    movie_2 = self.new
    movie_2.name = "Wonder"
    movie_2.theater = "Camino Real"
    movie_2.url = "https://www.fandango.com/wonder-199146/movie-overview"

    [movie_1, movie_2]
  end
end
