# I'm designing this around the Fandango site, so I can pull movie info by name (title),
# times, locations, and other data that will help users make an informed decision

class NowPlaying::Playing
  attr_accessor :name, :theater, :url, :summary

    def self.today
      # starts a scrape to return info for new movies playing in local theaters
      self.scrape_movies
    end

    def self.scrape_movies
      # go to Fandango
      # scrape movie info from their website
      # instantiate a return that shows info for chosen movie
      movies = []
      movies << self.scrape_fandango
      movies
    end

    def self.scrape_fandango
      doc = Nokogiri::HTML(open("https://www.fandango.com"))
      name = doc.search("h1.subnav_title").text
      theater = doc.search("div.movie-showtimes_theater").text
      url =
      summary = doc.search("").text
      binding.pry
    end
end
