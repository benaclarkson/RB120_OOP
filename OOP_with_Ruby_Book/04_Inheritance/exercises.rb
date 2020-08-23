# Exercises 1-6:

# module Towable
#   def tow
#     puts "I'm towing something!"
#   end
# end

# class Vehicle
#   attr_accessor :speed, :color
#   attr_reader :year, :model

#   @@number_of_vehicles = 0

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @speed = 0
#     @@number_of_vehicles += 1
#   end

#   def self.how_many_vehicles
#     puts "Vehicle objects created: #{@@number_of_vehicles}"
#   end

#   def self.gas_mileage(miles, gallons)
#     puts "Your gas mileage is #{miles / gallons} mpg."
#   end

#   def speed_up(increase)
#     puts "You hit the gas and increase your speed by #{increase} mph."
#     self.speed += increase
#   end

#   def brake(decrease)
#     if decrease >= speed
#       decrease = speed
#     end
#     self.speed -= decrease
#     puts "You hit the brakes and decrease your speed by #{decrease} mph."
#   end

#   def current_speed
#     puts "You are now going #{speed} mph."
#   end

#   def shut_off
#     puts "You park the vehicle and turn the engine off."
#     self.speed = 0
#   end

#   def spray_paint(new_color)
#     self.color = new_color
#     puts "Look at that fresh coat of #{self.color} paint! What a beaut!"
#   end

#   def age
#     puts "This vehicle is #{age_calculator(self.year)} year(s) old."
#   end

#   private

#   def age_calculator(year_car_was_built)
#     current_year = Time.now.year
#     current_year - year_car_was_built.to_i
#   end
# end

# class MyCar < Vehicle
#   INFO = {number_of_doors: 4, passengers: 5}

#   def to_s
#     "My car is a #{color}, #{year}, #{model}."
#   end

#   def car_info
#     puts "My car has #{INFO[:number_of_doors]} doors and can haul #{INFO[:passengers]} people."
#   end
# end

# class MyTruck < Vehicle
#   include Towable

#   INFO = {number_of_doors: 2, passengers: 3}

#   def to_s
#     "My truck is a #{color}, #{year}, #{model}."
#   end

#   def truck_info
#     puts "My truck has #{INFO[:number_of_doors]} doors and can haul #{INFO[:passengers]} people."
#   end
# end

# escape = MyTruck.new('2011', 'green', 'Ford Escape')
# puts escape
# escape.speed_up(75)
# escape.current_speed
# escape.brake(276)
# escape.current_speed
# escape.shut_off
# escape.spray_paint('yellow')
# escape.truck_info
# Vehicle.how_many_vehicles
# escape.tow
# escape.age
# puts MyTruck.ancestors

# puts "\n"

# focus = MyCar.new('2020', 'white', 'Ford Focus')
# puts focus
# focus.speed_up(98)
# focus.current_speed
# focus.brake(12)
# focus.current_speed
# focus.spray_paint('black')
# Vehicle.how_many_vehicles
# focus.car_info
# focus.age
# puts MyCar.ancestors

# puts "\n"
# puts Vehicle.ancestors


# Exercise 7:
class Student
  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than?(other_student)
    if grade > other_student.grade
      puts "True"
    else
      puts "False"
    end
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new('Joe', 85)
bob = Student.new('Bob', 74)

joe.better_grade_than?(bob)
bob.better_grade_than?(joe)


# Exercise 8:
# The method `hi` is private.
# Possible fixes:
# 1. Delete the `private` keyword (if `hi` is the only private method)
# 2. Move the `hi` method above the line on which `private` is located