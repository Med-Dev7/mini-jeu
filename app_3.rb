require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "Quels est ton nom ?"
print ">"
name = gets.chomp
my_game = Game.new("#{name}")
puts "\n"

while my_game.is_still_ongoing?
  puts "\n"
  my_game.show_players
  puts "\n"
  my_game.menu
  puts "\n"
  my_game.menu_choice
  my_game.enemies_attack
end
my_game.end
