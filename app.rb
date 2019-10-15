require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Darius")
player2 = Player.new("Garen")

while player1.life_points > 0 || player2.life_points > 0
  puts "Voici l'etat de nos joueurs :"
  player1.show_state
  player2.show_state
  puts "\n"

  puts player1.life_points
  puts player2.life_points
  puts "Passons à la phase d'attaque :"
  if player2.life_points > 0
    player1.attacks(player2)
  end
  if player1.life_points > 0
    player2.attacks(player1)
  end
  if player1.life_points <= 0 || player2.life_points <= 0
    break
  end
end
# player1.show_state
binding.pry
