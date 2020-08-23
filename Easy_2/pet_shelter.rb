# Pet Shelter

# Consider the following code:

class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
    "a #{animal} named #{name}"    
  end
end

class Owner
  attr_reader :name
  attr_accessor :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    self.pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    puts pets
  end
end

class Shelter
  attr_accessor :owners, :housed_pets

  def initialize
    @owners = {}
    @housed_pets = []
  end

  def house_pets(pet)
    self.housed_pets << pet
  end

  def release_pet(pet)
    self.housed_pets.reject! do |p|
      p == pet
    end
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    self.owners[owner.name] ||= owner
    self.release_pet(pet)
  end

  def print_adoptions
    self.owners.each_pair do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end

  def print_available_pets
    puts "The Animal Shelter has the following unadopted pets:"
    puts housed_pets
    puts
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.house_pets(butterscotch)
shelter.house_pets(pudding)
shelter.house_pets(darwin)
shelter.house_pets(kennedy)
shelter.house_pets(sweetie)
shelter.house_pets(molly)
shelter.house_pets(chester)

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.house_pets(asta)
shelter.house_pets(laddie)
shelter.house_pets(fluffy)
shelter.house_pets(kat)
shelter.house_pets(ben)
shelter.house_pets(chatterbox)
shelter.house_pets(bluebell)

shelter.print_available_pets
shelter.print_adoptions

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The Animal Shelter has #{shelter.housed_pets.size} unadopted pets."


# Write the classes and methods that will be necessary to make this code run, and print the following output:

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

# The order of the output does not matter, so long as all of the information is presented.