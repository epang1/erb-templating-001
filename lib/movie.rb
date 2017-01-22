require 'pry'

class Movie

  attr_accessor :title, :release_date, :director, :summary

  @@all_movies = []

  def initialize(title, release_date, director, summary)
    @title = title
    @release_date = release_date
    @director = director
    @summary = summary

    @@all_movies << self

  end

  def url
    formatted_title = @title.gsub(" ", "_").gsub("'", "").downcase
    "#{formatted_title}.html"
  end

  def self.all
    @@all_movies
  end

  def self.reset_movies!
    @@all_movies = []
  end

  def self.make_movies!
    file =  File.readlines("./spec/fixtures/movies.txt")
    file.each do |movie|
      movie_array = movie.split(" - ")
      title = movie_array[0]
      release_date = movie_array[1].to_i
      director = movie_array[2]
      summary = movie_array[3]
      Movie.new(title, release_date, director, summary)
    end
  end

  def self.recent
    recent_movies = []
    Movie.all.each do |movie|
      if movie.release_date >= 2012
        recent_movies << movie

      end
    end

    recent_movies

  end



end
