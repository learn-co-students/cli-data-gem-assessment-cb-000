# I'm designing this around the IMDB site, so I can pull movie info by name (title),
# times, locations, and other data that will help users make an informed decision

class NowPlaying::Playing
  attr_accessor :title, :url, :summary

      def self.today
      # starts a scrape to return info for new movies playing in local theaters
        self.scrape_movies
      end

      def self.scrape_movies
       # go to IMDB
       # scrape "In Theaters" movie info from their website
       # instantiate a return that shows info for chosen movie
        movies = []
        movies << self.scrape_imdb
        movies
      end


      def self.scrape_imdb

        doc = Nokogiri::HTML(open("http://www.imdb.com/movies-in-theaters/?ref_=nv_mv_inth_1"))

          movie = self.new
          movie.title = doc.search("div.list_item.odd h4").first.text
          movie.url = doc.search("div.list_item.odd a").first.attr("href")
          movie.summary = doc.search("div.outline").first.text
          movie
      end
end
