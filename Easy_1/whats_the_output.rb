# What's the Output?

# Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

# What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

# Further Exploration:
name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# Lines 27-33 produce the "strange" result because the instance variable `@name` and the `initialize` method argument `name` do not point to the same object in memory. After the `initialize` method is called, `@name` points to the return value of calling the `#to_s` method on the `name` argument. On `line 29`, the local variable `name`, outside of the Pet class scope, still points to an integer. Therefore, when the `+=` method is called, the value of `42` is incremented by `1`.