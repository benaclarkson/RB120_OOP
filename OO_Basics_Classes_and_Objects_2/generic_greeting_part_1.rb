# Generic Greeting (Part 1)

# Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
kitty = Cat.new
kitty.class.generic_greeting

# Further Exploration:
# Calling the #class method on the `kitty` object returns the `Cat` class. When calling the `generic_greeting` class method, `self` is used and therefore it is the equivalent of calling `Cat.generic_greeting` which we do on line 13.

# Expected output:

# Hello! I'm a cat!