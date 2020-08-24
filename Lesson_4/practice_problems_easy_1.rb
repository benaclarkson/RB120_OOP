# Question 1

# Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

# 1. true
# 2. "hello"
# 3. [1, 2, 3, "happy days"]
# 4. 142

# All of the items listed are objects. The class they belong to can be determined by calling the `class` method on each.

puts true.class
puts "hello".class
puts [1, 2, 3, "happy days"].class
puts 142.class

#----------------------------------------------------------------

# Question 2

# If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed? How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

# We can give both the `Car` class and the `Truck` class the ability to go fast by mixing in the `Speed` module to both classes.
# We can then check if they can now go fast by calling the `go_fast` method on instances of both objects.

car = Car.new
truck = Truck.new
car.go_fast
truck.go_fast

#----------------------------------------------------------------

# Question 3

# In the last question we had a module called Speed which contained a go_fast method. We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

# When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

small_car = Car.new
small_car.go_fast
# => I am a Car and going super fast!

# The name of the type of vehicle is accessed by calling the `class` method on `self` on `line 60`. `self` here represents the instance we created on `line 73`. When we call `class` on this instance, the corresponding class is returned, then converted to a string because using string interpolation as we did invokes the `to_s` method.

#----------------------------------------------------------------

# Question 4

# If we have a class AngryCat how do we create a new instance of this class?

# The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

# To create an instance of the `AngryCat` class, we simply have to invoke the `new` method on the class. We can go a step further and assign that value to a variable which can be used to later access the methods within.
# For instance:
AngryCat.new
AngryCat.new.hiss
assigned_to_a_variable = AngryCat.new
assigned_to_a_variable.hiss

#----------------------------------------------------------------

# Question 5

# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# The `Pizza` class is the only class shown here which contains an instance variable. Instance variables are defined using a `@` at the beginning of the name.

#----------------------------------------------------------------

# Question 6

# What could we add to the class below to access the instance variable @volume?

class Cube
  # attr_reader :volume
  # attr_writer :volume
  attr_accessor :volume

  def initialize(volume)
    @volume = volume
  end

  # def volume
  #   @volume
  # end

  # def volume=(v)
  #   @volume = v
  # end
end

# We could either add a getter method to the class or use the shorthand of `attr_reader :volume` to be able to read `value`. If the information stored in `value` needs only to be manipulated, we would need to change the `attr_reader` to `attr_writer` or add a setter method to the class. Lastly, if `value` needs to be viewed and manipulated, we would need to change that line to `attr_accessor`.

#----------------------------------------------------------------

# Question 7

# What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

# The default return value of `to_s` when invoked on an object is a string representing the object (i.e. the `#<Car:0x00005591f7f56f98>` format. This information is presented in the Ruby documentation for `Object#to_s`:
# Returns a string representing obj. The default to_s prints the object's class and an encoding of the object id. As a special case, the top-level object that is the initial execution context of Ruby programs returns “main''.

#----------------------------------------------------------------

# Question 8

# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. What does self refer to here?

# In this above example, `self` refers to the instance of the `Cat` class.
# For example, given the following code:
kitty = Cat.new('tabby')

# `self.age` on `line 170` is the equivalent of calling `kitty.age`.

#----------------------------------------------------------------

# Question 9

# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# In the name of the cats_count method we have used self. What does self refer to in this context?

# Within the class method definition on `lines 197-199`, `self` refers to the class itself. It would be called like so: `Cat.cats_count`

#----------------------------------------------------------------

# Question 10

# If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# To create a new instance of the `Bag` class, you would need to invoke the `new` method on said class and pass in two arguments (color and material).