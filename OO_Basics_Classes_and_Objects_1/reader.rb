# Reader

# Using the code from the previous exercise, add a getter method named #name and invoke it in place of @name in #greet.

# Code:

# Solution 1:
class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end

  def name
    @name
  end
end

# Solution 2:
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end

end

kitty = Cat.new('Sophie')
kitty.greet


# Expected output:

# Hello! My name is Sophie!