# Question 1

# Alyssa has been assigned a task of modifying a class that was initially created to keep track of secret information. The new requirement calls for adding logging, when clients of the class attempt to access the secret data. Here is the class in its current form:

class SecretFile
  attr_reader :data

  def initialize(secret_data)
    @data = secret_data
  end
end

# She needs to modify it so that any access to data must result in a log entry being generated. That is, any call to the class which will result in data being returned must first call a logging class. The logging class has been supplied to Alyssa and looks like the following:

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end

# Hint: Assume that you can modify the initialize method in SecretFile to have an instance of SecurityLogger be passed in as an additional argument. It may be helpful to review the lecture on collaborator objects for this practice problem.

# To achieve the secret log capability, I would add a new instance variable, `@log`, to the `initialize` method in the `SecretFile` class below `line 9`. Then, I would assign the collaborator object, `SecurityLogger.new.create_log_entry` to `@log`.

class SecretFile
  attr_reader :data

  def initialize(secret_data)
    @data = secret_data
    @log = SecurityLogger.new.create_log_entry
  end
end

#----------------------------------------------------------------

# Question 2

# Ben and Alyssa are working on a vehicle management system. So far, they have created classes called Auto and Motorcycle to represent automobiles and motorcycles. After having noticed common information and calculations they were performing for each type of vehicle, they decided to break out the commonality into a separate class called WheeledVehicle. This is what their code looks like so far:

module Efficiency
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Efficency

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

# Now Alan has asked them to incorporate a new type of vehicle into their system - a Catamaran defined as follows:

class Catamaran
  include Efficency

  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end

# This new class does not fit well with the object hierarchy defined so far. Catamarans don't have tires. But we still want common code to track fuel efficiency and range. Modify the class definitions and move code into a Module, as necessary, to share code among the Catamaran and the wheeled vehicles.

#----------------------------------------------------------------

# Question 3

# Building on the prior vehicles question, we now must also track a basic motorboat. A motorboat has a single propeller and hull, but otherwise behaves similar to a catamaran. Therefore, creators of Motorboat instances don't need to specify number of hulls or propellers. How would you modify the vehicles code to incorporate a new Motorboat class?

# To accommodate a `Motorboat` class, I would create a new class, `AmphibiousVehicles` using the majority of code from the `Catamaran` class. Then, I would create a `Motorboat` class, which would inherit from the `Amphibious` class, and call `super` with values of `1` for `num_propellers` and `num_hulls` in the `initialize` method.

class Amphibious
  include Efficiency

  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, liters_of_fuel_capacity, km_traveled_per_liter)
    @num_propellers = num_propellers
    @num_hulls = num_hulls
    @fuel_capacity = liters_of_fuel_capacity
    @fuel_efficiency = km_traveled_per_liter
  end
end

class Motorboat < Amphibious
  def initialize(liters_of_fuel_capacity, km_traveled_per_liter)
    super(1, 1, liters_of_fuel_capacity, km_traveled_per_liter)
  end
end

#----------------------------------------------------------------

# Question 4

# The designers of the vehicle management system now want to make an adjustment for how the range of vehicles is calculated. For the seaborne vehicles, due to prevailing ocean currents, they want to add an additional 10km of range even if the vehicle is out of fuel.

# Alter the code related to vehicles so that the range for autos and motorcycles is still calculated as before, but for catamarans and motorboats, the range method will return an additional 10km.

# To accomplish the above task, we would override the `range` method in the `Efficiency` module by adding a `range` method to the `Amphibious` class like so:

class Amphibious
  include Efficiency

  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, liters_of_fuel_capacity, km_traveled_per_liter)
    @num_propellers = num_propellers
    @num_hulls = num_hulls
    @fuel_capacity = liters_of_fuel_capacity
    @fuel_efficiency = km_traveled_per_liter
  end

  def range
    super + 10
  end
end