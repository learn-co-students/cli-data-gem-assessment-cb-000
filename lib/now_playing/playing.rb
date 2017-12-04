# I'm designing this around the IMDB site, so I can pull movie info by name (title),
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
      movies << self.scrape_imdb
      movies
    end

    def self.scrape_imdb
      doc = Nokogiri::HTML(open("http://www.imdb.com/movies-in-theaters/?ref_=nv_mv_inth_1"))
      doc.css("td.overview-top h4 a").text
      binding.pry
    end
end
