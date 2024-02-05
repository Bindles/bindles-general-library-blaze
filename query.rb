username = 'zer'
user = Movie.find_by(name: username)

if user.nil?
  puts "No user found with username '#{username}'"
elsif Moviewhere(name: username).count > 1
  puts "Multiple users found with username '#{username}'"
  # Handle the duplicate user scenario here
else
  puts "User found: #{user.inspect}"
  # Continue processing the user object
end

if user.nil?
  puts "No user found with username '#{username}'"
elsif Moviewhere(name: username).count > 1
  puts "Multiple users found with username '#{username}'"
  # Handle the duplicate user scenario here
else
  puts "User found: #{user.inspect}"
  # Continue processing the user object
end

movie_name = 'zer'
movie = Movie.find_by(name: movie_name)

if movie.nil?
  puts "No movie found with name '#{movie_name}'"
elsif Movie.where(name: movie_name).count == 2
  puts "Multiple movies found with name '#{movie_name}'"
  # Handle the duplicate movie scenario here
else
  puts "Movie found: #{movie.inspect}"
  # Continue processing the movie object
end
