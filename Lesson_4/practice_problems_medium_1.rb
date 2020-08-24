# Question 1

# Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ before balance when you refer to the balance instance variable in the body of the positive_balance? method."

# "Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

# Who is right, Ben or Alyssa, and why?

# Ben is right in this scenario, because he uses a valid `getter` method with the `attr_reader :balance` code on `line 6`. The `balance` on `line 13` is actually a `getter` method call, which returns the value stored in the `@balance` instance method.

#----------------------------------------------------------------

# Question 2

# Alan created the following code to keep track of items for a shopping cart application he's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

# Can you spot the mistake and how to address it?

# The error is on `line 41` (or `line 32`, depending on the solution you choose). Looking at the former, the `quantity` shown there is not a reference to the `setter` method (because one doesn't exist) and is actually just a local variable. This could be solved by prepending `quantity` with an `@` and calling the instance variable directly. The latter solution would be to change `attr_reader` to `attr_accessor`, thus creating a `setter` method for `quantity` and then prepending `quantity` on `line 41` with `self.` to invoke the `setter` method.

#----------------------------------------------------------------

# Question 3

# In the last question Alan showed Alyssa this code which keeps track of items for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# Alyssa noticed that this will fail when update_quantity is called. Since quantity is an instance variable, it must be accessed with the @quantity notation when setting it. One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.

# Is there anything wrong with fixing it this way?

# The only potential issue with fixing the problem in the way described above is that we would also be adding a `setter` method for the `product_name` instance variable as well. What should ideally happy is that we remove `:quantity` from the `attr_reader` on `line 58` and add a new line above it with the follow code: `attr_accessor :quantity`.

#----------------------------------------------------------------

# Question 4

# Let's practice creating an object hierarchy.

# Create a class called Greeting with a single instance method called greet that takes a string argument and prints that argument to the terminal.

# Now create two other classes that are derived from Greeting: one called Hello and one called Goodbye. The Hello class should have a hi method that takes no arguments and prints "Hello". The Goodbye class should have a bye method to say "Goodbye". Make use of the Greeting class greet method when implementing the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye classes.

class Greeting
  def greet(msg)
    puts msg
  end
end

class Hello < Greeting
  def hi
    greet('Hello')
  end
end

class Goodbye < Greeting
  def bye
    greet('Goodbye')
  end
end

#----------------------------------------------------------------

# Question 5

# You are given the following class that has been implemented:

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end
end

# And the following specification of expected behavior:

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  # => "Plain"

puts donut2
  # => "Vanilla"

puts donut3
  # => "Plain with sugar"

puts donut4
  # => "Plain with chocolate sprinkles"

puts donut5
  # => "Custard with icing"

# Write additional code for KrispyKreme such that the puts statements will work as specified above.

class KrispyKreme
  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling_string = filling_type ? filling_type : "Plain"
    glazing_string = glazing ? " with #{glazing}" : ''
    filling_string + glazing_string
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  # => "Plain"

puts donut2
  # => "Vanilla"

puts donut3
  # => "Plain with sugar"

puts donut4
  # => "Plain with chocolate sprinkles"

puts donut5
  # => "Custard with icing"

#----------------------------------------------------------------

# Question 6

# If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# The code on `lines 184-194` employs the technique of calling the `@template` instance variable directly on `line 188` and then invoking the `getter` method (created on `line 185`) on `line 192`.
# The second batch of code on `lines 198-208` utilizes `self` on `line 202` to invoke the `setter` method (created on line `199`) and then uses `self` again on `line 206`. The latter use of `self` is not necessary, but does not prevent the code from working properly.
# Both groups of code do the same thing. They just arrive at the end point in different ways.

#----------------------------------------------------------------

# Question 7

# How could you change the method name below so that the method name is more clear and less repetitive?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end
end

# Because, to invoke the method, we will have to call `Light.light_status`, we could remove `light_` in the method name so that the necessary call is simply `Light.status`.