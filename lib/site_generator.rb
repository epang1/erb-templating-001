class SiteGenerator

  def make_index!

    html = "<!DOCTYPE html><html><head><title>Movies</title></head><body><ul>"

    Movie.all.each do |movie|
     html = "#{html}<li><a href=\"movies/#{movie.url}\">#{movie.title}</a></li>"
    end

    html = "#{html}</ul></body></html>"

    File.open('./_site/index.html', 'w') { |file| file.write("#{html}") }
  end

  def generate_pages!

    other_movies = ""
    Movie.all.each do |movie|
      other_movies = "#{other_movies}<li><a href=\"#{movie.url}\">#{movie.title}</a></li>"
    end

    erb = ERB.new(File.read('lib/templates/movie.html.erb'))
    
    Movie.all.each do |movie|
      File.open("./_site/movies/#{movie.url}", "w") do |f|  
        document = erb.result(binding)
        f.write(document)
      end
    end
  end

end
