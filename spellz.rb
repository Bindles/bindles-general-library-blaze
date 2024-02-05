# Define a struct for spells in an RPG
Spell = Struct.new(:name, :element, :damage, :mana_cost)

# Create instances of spells
fireball = Spell.new("Fireball", "Fire", 20, 10)
ice_shard = Spell.new("Ice Shard", "Ice", 15, 8)
lightning_bolt = Spell.new("Lightning Bolt", "Lightning", 25, 12)

# Access attributes of the spells
puts "Spell Name: #{fireball.name}"
puts "Spell Element: #{fireball.element}"
puts "Spell Damage: #{fireball.damage}"
puts "Spell Mana Cost: #{fireball.mana_cost}"

puts "\nAvailable Spells:"
[fireball, ice_shard, lightning_bolt].each do |spell|
  puts "#{spell.name}: #{spell.element} damage - #{spell.mana_cost} mana"
end


# Define a struct for spells in an RPG
Spell = Struct.new(:name, :element, :damage, :mana_cost) do
  @spells ||= []  # Initialize the array of spells if it's nil

  # Class method to add a spell to the array
  def self.add_spell(spell)
    @spells << spell
  end

  # Class method to retrieve all spells
  def self.all_spells
    @spells
  end

  # Automatically add the newly created spell to the array
  add_spell(self)
end

# Create instances of spells
fireball = Spell.new("Fireball", "Fire", 20, 10)
ice_shard = Spell.new("Ice Shard", "Ice", 15, 8)
lightning_bolt = Spell.new("Lightning Bolt", "Lightning", 25, 12)

# Access attributes of the spells
puts "Spell Name: #{fireball.name}"
puts "Spell Element: #{fireball.element}"
puts "Spell Damage: #{fireball.damage}"
puts "Spell Mana Cost: #{fireball.mana_cost}"

puts "\nAvailable Spells:"
Spell.all_spells.each do |spell|
  puts "#{spell.name}: #{spell.element} damage - #{spell.mana_cost} mana"
end
1