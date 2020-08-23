# What Will This Do?

# What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

# Initialize a new object of the `Something` class, `thing`
thing = Something.new

# Call the `puts` method on the return value of calling the `dupdata` class method on the `Something` class, which outputs the string "ByeBye"
puts Something.dupdata

# Call the `puts` method on the return value of calling the `dupdata` instance method on the `thing` object, which outputs the string "HelloHello"
puts thing.dupdata