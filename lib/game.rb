class Game
  attr_accessor :human_player, :enemies

  # initialize l'instanciation
  def initialize(name)
    @enemies = [Player.new("bot_01"),Player.new("bot_02"), Player.new("bot_03"), Player.new("bot_04")]
    @human_player = HumanPlayer.new(name)
  end

  # efface dans les ennemie eleminer
  def kill_player(enemy)
    @enemies.delete(enemy)
  end

  # verifie si il la partie continue
  def is_still_ongoing?
    if @human_player.life_points > 0 && @enemies.empty? != true
      return true
    else
      return false
    end
  end

  # affiche l etat du joueur et le nombre d'ennemi
  def show_players
    @human_player.show_state
    number_enemy = @enemies.count
    puts "Il reste #{number_enemy} ennemi !"
  end

  # Affiche les option
  def menu
    # rajouter un visuel un cadre au niveau du choix
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "\n"
    puts "attaquer un joueur en vue :"
    @enemies.each_with_index do |v, i|
    print "#{i+1} - "
    v.show_state
    end
  end

  # demande un input qui lance une methode
  def menu_choice()
    option = gets.chomp
    if option == "a"
      puts "\n"
      @human_player.search_weapon
    elsif option == "s"
      puts "\n"
      @human_player.search_health_pack
    elsif option == option.to_i.to_s
      @enemies.each_with_index do |v, i|
        if option.to_i == i+1
          puts "koooooooooooo"
          @human_player.attacks(v)
          v.show_state
        end
        if v.life_points <= 0
          kill_player(v)
        end
      end
    end
  end

  # Attque des enemie sur le joueur
  def enemies_attack
    puts "\n"
    puts "Les autres joueurs t'attaquent !"
    @enemies.each do |x|
      if x.life_points > 0
        x.attacks(@human_player)
        puts "\n"
      end
    end
  end

  # Messaege si gagner ou perdu
  def end
    @enemies.each do |v|
      if @human_player.life_points > 0 && v.life_points <= 0
        puts "BRAVO ! TU AS GAGNE !"
        puts @human_player.name
      elsif v.life_points > 0 && @human_player.life_points <= 0
        puts "Dommage ! Tu as perdu !"
        break
      end
    end
  end

end
