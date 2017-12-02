class NowPlaying::CLI #opens the app
  def call
    start
  end

  def list
    puts ""
    puts "************* Now Playing in Theatres *************"
    puts ""
    NowPlaying::Movie.all.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name}" #finds and then prints the movie name
    end
    puts ""
  end

  def print_movie(movie) # prints out details provided on site about movie including summary and stars
    puts ""
    puts "-------------- #{movie.name} --------------"

    puts ""
    puts movie.summary
    puts ""

    puts "Starring: #{movie.stars}"
    puts ""
  end

  def start
    list
    input = nil
    while input != "exit"
      puts ""
      puts "What movie would you more information on, by name or number?" # asks app user for movie name to scrape for that title
      puts ""
      puts "Enter list to see the movies again."
      puts "Enter exit to end the program." #asks to end the program
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input.to_i == 0
        if movie = NowPlaying::Movie.find_by_name(input)
          print_movie(movie)
        end
      elsif input.to_i > 0
        if movie = NowPlaying::Movie.find(input.to_i)
          print_movie(movie)
        end
      end
    end
    puts "Goodbye!!!"
  end
end
