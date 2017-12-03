class NowPlaying::CLI

  def call
    puts "Your Path to Hollywood:"
    list_movies
    menu
    goodbye
  end

  def list_movies
    puts "Most recent releases: "
    @movies = NowPlaying::Playing.today
    @movies.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name} - #{movie.theater} - #{movie.url} - #{movie.summary}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the title of the film you're looking for or type movies for more titles or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        puts @movies[input.to_i-1]
      elsif input == "list"
        list_movies
      else
        puts "What are you looking for this evening, type list or exit."
      end
  end
end

  def goodbye
    puts "See you at the movies!"
  end

end
