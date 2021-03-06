def view_my_favorites
  system("clear")
  font = TTY::Font.new(:Doom)
  pastel = Pastel.new
  puts pastel.green(font.write ("Favorites"))
  sleep(0.5)
  fav = @snacker.favorite_snacks.reload
  if fav.empty?
    puts "You don't have any favorite recipes saved yet!"
    puts "Choose a different option"
    self.snacker_menu
  else
    puts "Here are your favorite recipes:"
    i = 1
    fav.each do |fave|
      puts "#{i}. #{fave.name}"
      i += 1
      sleep(1.0)
    end
    puts "Returning to main menu..."
    self.snacker_menu
  end
end