# Nobility

# Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. Nobility need to strut.

module Walkable
  def walk
    puts "#{self} #{gait} forward"
  end
end

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

class Noble < Animal
  include Walkable

  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def to_s
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end

class Person < Animal
  include Walkable

  private

  def gait
    "strolls"
  end
end

class Cat < Animal
  include Walkable

  private

  def gait
    "saunters"
  end
end

class Cheetah < Animal
  include Walkable

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

# We need a new class Noble that shows the title and name when walk is called:

byron = Noble.new("Byron", "Lord")
puts byron.walk
# => "Lord Byron struts forward"

# We must have access to both name and title because they are needed for other purposes that we aren't showing here.

puts byron.name
# => "Byron"
puts byron.title
# => "Lord"