# I'm designing this around the Fandango site, so I can pull movie info by name (title),
# times, locations, and other data that will help users make an informed decision

class NowPlaying::Playing
  attr_accessor :name, :theater, :url, :summary

  def self.today
    # scrape Fandango and return info for new movies playing in local theaters
    movie_1 = self.new
    movie_1.name = "Coco"
    movie_1.theater = "Fairview Twin"
    movie_1.url = "https://www.fandango.com/coco-2017-185799/movie-overview"
    movie_1.summary = "blah blah blah"

    movie_2 = self.new
    movie_2.name = "Wonder"
    movie_2.theater = "Camino Real"
    movie_2.url = "https://www.fandango.com/wonder-199146/movie-overview"
    movie_2.summary = "blah blah blah"

    movie_3 = self.new
    movie_3.name = "Daddy's Home"
    movie_3.theater = "Fairview Twin"
    movie_3.url = "https://www.fandango.com/daddys-home-2-202199/movie-overview"
    movie_3.summary = "blah blah blah"

    movie_4 = self.new
    movie_4.name = "Thor: Ragnarok"
    movie_4.theater = "Camino Real"
    movie_4.url = "https://www.fandango.com/thor-ragnarok-2017-199155/movie-overview"
    movie_4.summary = "blah blah blah"

    [movie_1, movie_2, movie_3, movie_4]
  end
end
