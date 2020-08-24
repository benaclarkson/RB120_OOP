# Question 1

# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:

hello = Hello.new
hello.hi

# Case 1 will output "Hello"

# case 2:

hello = Hello.new
hello.bye

# Case 2 will result in a NoMethodError becuase the `Hello` class does not have access to the `bye` method in the `Goodbye` class.

# case 3:

hello = Hello.new
hello.greet

# Case 3 will result in an error, due to the fact that no arguments were passed to the `greet` method when invoked.

# case 4:

hello = Hello.new
hello.greet("Goodbye")

# Case 4 will output `"Goodbye"` since the `Hello` class has access to the `greet` method via inheritance.

# case 5:

Hello.hi

# Case 5 will result in a NoMethodError, due to the fact that the `hi` method is not a class method. You could adjust the code to be `Hello::hi` and that would work.

#----------------------------------------------------------------

# Question 2

# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?

# To fix the issue, we can either change the way in which we call the method to `Hello::hi` or we can change the instance method `hi` to a class method, by prepending the method name with `self.`.

#----------------------------------------------------------------

# Question 3

# When objects are created they are a separate realization of a particular class.

# Given the class below, how do we create two different instances of this class, both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# You could accomplish the above request with the following code:
johnson = AngryCat.new(6, 'Johnson')
nona = AngryCat.new(7, 'Nona')

#----------------------------------------------------------------

# Question 4

# Given the class below, if we created a new instance of the class and then called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

class Cat
  def initialize(type)
    @type = type
  end
end

# How could we go about changing the to_s output on this method to look like this: I am a tabby cat? (this is assuming that "tabby" is the type we passed in during initialization).

# To change the `to_s` output, we would have to add an `attr_reader` for the `type` instance variable as well as define our own `to_s` method like so:
class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I'm a #{type} cat"
  end
end

#----------------------------------------------------------------

# Question 5

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer #=> This would result in an error, due to the fact that `self.manufacturer` is a class method, not an instance method.
tv.model #=> This would work as expected.

Television.manufacturer #=> This would work as expected.
Television.model #=> This would result in an error, due to the fact that `model` is an instance method, not a class method.

#----------------------------------------------------------------

# Question 6

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

# In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?

# We could reference the instance variable directly by prepending a `@` symbol onto `age` on `line 185`.

#----------------------------------------------------------------

# Question 7

# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# The following add no value to the above code:
# 1. `attr_accessor`s on `line 200`. Only because it is no being used in the code.
# 2. `return` on `line 208`. Ruby will implicitly return the string if the `self.information` class method is invoked.