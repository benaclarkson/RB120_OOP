# 1. How do we create an object in Ruby? Give an example of the creation of an object.

# To create an object, you must first create a class from which to create an object.
# For instance, if you have the following class:
class TestSubject
  include SayName
end

# You would create an object by calling the `new` method on the class like so:
subject001 = TestSubject.new
subject001.say_name('Susan')


# 2. What is a module? What is its purpose? How do we use them in our classes?
#    Create a module for the class you created in exercise 1 and include it properly.

# A module is similar to a class. Another way to achieve polymorphism in Ruby.
# Its purpose is to allow shared behavior between classes. You can define the module in one area and then use it multiple times in multiple classes.
# To use a module in a class, you must `include` it via a mixin.
# An example (although this would need to be typed above the class initialization):
module SayName
  def say_name(name)
    puts "My name is #{name}."
  end
end