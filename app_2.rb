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
human = HumanPlayer.new("#{name}")
bot_01 = Player.new("jose")
bot_02 = Player.new("Josiane")
enemy = [bot_01, bot_02]

while (human.life_points > 0  && (bot_01.life_points > 0 || bot_02.life_points > 0 ))

  human.show_state
  puts "\n"
  puts "Quelle action veux-tu effectuer ?"
# rajouter un visuel un cadre au niveau du choix
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "\n"
  puts "attaquer un joueur en vue :"
  # puts "\n"
  print "0 - "
  bot_01.show_state
  print "1 - "
  bot_02.show_state
  option = gets.chomp
  if option == "a"
    puts "\n"
    human.search_weapon
  elsif option == "s"
    puts "\n"
    human.search_health_pack
  elsif option == "0"
    puts "\n"
    human.attacks(bot_01)
    bot_01.show_state
  elsif option == "1"
    puts "\n"
    human.attacks(bot_02)
    bot_02.show_state
  end
  puts "\n"
  puts "Les autres joueurs t'attaquent !"
  enemy.each do |x|
    if x.life_points > 0
      x.attacks(human)
      puts "\n"
    end
  end
end

if (human.life_points > 0 && (bot_01.life_points <= 0 && bot_02.life_points <= 0 ))
  puts "BRAVO ! TU AS GAGNE !"
elsif (bot_01.life_points > 0 && bot_02.life_points > 0 ) && human.life_points <= 0
  puts "Dommage ! Tu as perdu !"
end

binding.pry
