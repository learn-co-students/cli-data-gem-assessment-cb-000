class NowPlaying::CLI

  def call
    start
  end

  def list_movies
    puts "Most recent releases: "
    NowPlaying::Playing.all.with_index(1) do |movie, i|
      puts "#{i}. #{movie.title} - #{movie.url} - #{movie.summary}"
    end
    puts ""
  end

  def print_movie(movie)
    puts ""
    puts "****#{movie.title}****"

    puts ""
    puts movie.url
    puts ""

    puts ""
    puts movie.summary
    puts ""
  end

  def start
    list_movies
    input = nil
    while input != "exit"
      puts ""
      puts "Enter the name of the movie you're interested in learning more about today: "
      puts ""
      puts "Enter list to see movies you've checked out again: "
      puts "Enter exit, if you wish to leave."
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input.to_i == 0
        if movie = NowPlaying::Playing.find_by_title(input)
          print_movie(movie)
        end
      elsif input.to_i > 0
        if movie = NowPlaying::Playing.find(input.to_i)
        print_movie(movie)
      end
    end
  end
    puts "See you at the movies!!"
  end
end
