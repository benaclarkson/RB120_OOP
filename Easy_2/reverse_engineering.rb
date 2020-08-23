# Reverse Engineering

# Write a class that will display:

# ABC
# xyz

class Transform
  attr_accessor :str

  def initialize(str)
    @str = str
  end

  def uppercase
    # No notes about mutating the input, so I'm going to
    self.str.upcase!
  end

  def self.lowercase(str)
    str.downcase
  end
end

# when the following code is run:

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')