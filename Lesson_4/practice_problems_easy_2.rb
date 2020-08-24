# Question 1

# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future

# The result of executing the code on `lines 17-18` would vary, depending on the result of invoking the `sample` method on the return value of the `choices` method. `line 18` will return one of the following strings:
#=> "You will eat a nice lunch"
#=> "You will take a nap soon"
#=> "You will stay at work late"

#----------------------------------------------------------------

# Question 2

# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

# On `lines 42-44`, the `choices` method within the `RoadTrip` class overrides the method in the `Oracle` class, which `RoadTrip` initially inherited. Due to this override, the invocation of the `predict_the_future` class on the `trip` object on `line 50` will return one of the following strings:
#=> "You will visit Vegas"
#=> "You will fly to Fiji"
#=> "You will romp in Rome"

#----------------------------------------------------------------

# Question 3

# How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?

# One can find an object's ancestors by calling the `Module#ancestors` method on an object.
# The lookup chain for Orange is:
# Orange
# Taste
# Object
# Kernel
# BasicObject

# The loookup chain for HotSauce is:
# HotSauce
# Taste
# Object
# Kernel
# BasicObject

#----------------------------------------------------------------

# Question 4

# What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

# Inserting an `attr_accessor` for `:type` below `line 100` would allow us to delete the `type` getter method on `lines 105-107` and the `type` setter method on `lines 109-111`.
# Additionally, because we have created a getter method for the `@type` instance variable, we can remove the direct call to the instance variable on `line 128` and instead just invoke the getter method by calling `type`. The updated code is as follows.

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

#----------------------------------------------------------------

# Question 5

# There are a number of variables listed below. What are the different types and how do you know which is which?

excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"

# The code on `line 139` shows a local variable in use. It is identifiable by the fact that the variable name is comprised of lowercase, alphabetic characters and each word is separated by an underscore.
# The code on `line 140` shows an instance variable in use. It is identifiable by the `@` symbol preceeding the lowercase, alphabetic characters with each word separated by an underscore.
# The code on `line 141` shows a class variable in use. It is identifiable in that it is the same as the instance variable, but with an additional `@` character at the beginning.

#----------------------------------------------------------------

# Question 6

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# `self.manufacturer` is the only class method definition shown in the above code. It is identifiable by the `self` preceeding the method name.
# To call a class method, simply invoke the method on the class itself like so:
Television.manufacturer

#----------------------------------------------------------------

# Question 7

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

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# `@@cats_count` is a class variable, which is initialized as `0` on `line 176`. When the `new` method is invoked on the `Cat` class, the `initialize` method is simultaneously invoked, incrementing the integer stored in the `@@cats_count` class variable by `1`. When the `self.cats_count` class method is invoked, the `@@cats_count` class variable is returned, which represents how many `Cat` objects/instances have been created.
# The following code exemplifies the above explanation:
kitty = Cat.new('tabby')
puts Cat.cats_count

#----------------------------------------------------------------

# Question 8

# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

# And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the play method from the Game class?

# To allow the `Bingo` class to inherit from the `Game` class, we just need to add ` < Game` after `Bingo` on `line 210`.

#----------------------------------------------------------------

# Question 9

# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

# If we added a `play` method to the `Bingo` class, it would essentially "override" the `play` method defined in the `Game` class, due to the hierarchy of the lookup path. Ruby will first look in the class of the object/instance and therefore default to the `play` method in the `Bingo` class.

#----------------------------------------------------------------

# Question 10

# What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.

# The benefits (that I can think of) of using OOP in Ruby are as follows:
# 1. The ability to create DRY, scalable code through use of inheritance, encapsulation, polymorphism, and module mixins.
# 2. Utilizing collaborator objects to allow more in-depth states of different objects.
# 3. Being able to encapsulate specific areas of code using private and public methods, as well as using namespacing techniques to group code together in specific modules.
# 4. It's a higher-level conceptualization of code, so you can think more of archetypes or molds instead of the minutiae of a smaller, specific concepts.