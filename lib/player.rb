class Player

  attr_accessor :name, :life_points

  # initialise les parametres de base du joueur
  def initialize(name)
    @name = name
    @life_points = 10
  end

  # affiche les stats du joueurs
  def show_state
    puts "#{@name} a #{@life_points} de vie"
  end

  # Methode qui diminue les points de vie en fonction des degats
  # et affiche si l'aversersaire est tomber
  def gets_damage(damage)
      @life_points = @life_points - damage.to_i
      if @life_points <= 0
        puts "Le joueur #{@name} a ete tue !"
      end
  end

  # Methode qui attaque l'adversaire
  # et affiche le montent de dommage infliger
  def attacks(enemy)
    puts "#{@name} attaque #{enemy.name}"
    damage = compute_damage
    puts "il lui inflige #{damage} points de dommages"
    enemy.gets_damage(damage)
  end

  # Methode qui genere un nombre de degat aleatoire entre 1 et 6
  def compute_damage
    return rand(1..6)
  end
end


class HumanPlayer < Player
  attr_accessor  :weapon_level
  
  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
      return rand(1..6) * @weapon_level
  end

  def search_weapon
    rand_weapons = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{rand_weapons}"
    if @weapon_level < rand_weapons
      @weapon_level = rand_weapons
    elsif @weapon_level <= rand_weapons
      puts "elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    rand_health = rand(1..6)
    if rand_health == 1
      puts "Tu n'as rien trouvé... "
    elsif rand_health >= 2 && rand_health <= 5
      @life_points = @life_points + (50 - ( 50 - (100 - @life_points)))
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    elsif rand_health == 6
      @life_points = @life_points + (80 - ( 80 - (100 - @life_points)))
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end


end
