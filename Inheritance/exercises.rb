# Exercise 1:

# Given this class:

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog
  def swim
    'can\'t swim!'
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

karl = Bulldog.new
puts karl.speak
puts karl.swim

# One problem is that we need to keep track of different breeds of dogs, since they have slightly different behaviors. For example, bulldogs can't swim, but all other dogs can.

# Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

#------------------------------------------------------------------------------

# Exercise 2:
# Let's create a few more methods for our Dog class.
class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
  def fetch
    'fetching!'
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

class Bulldog < Dog
  def swim
    'can\'t swim!'
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

puts pete.run
# pete.speak

puts kitty.run
puts kitty.speak
# kitty.fetch

puts dave.speak

puts bud.run
puts bud.swim

# Create a new class called Cat, which can do everything a dog can, except swim or fetch. Assume the methods do the exact same thing. Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.

#------------------------------------------------------------------------------

# Exercise 3:
# Draw a class hierarchy diagram of the classes from step #2

# Bulldog > Dog > Pet
#           Cat > Pet

#------------------------------------------------------------------------------

# Exercise 4:
# What is the method lookup path and how is it important?

# A method lookup path is the order in which classes are inspected when you call a method. It is important because it determines precendence of methods with the same name as well as the order in which methods within modules are called.