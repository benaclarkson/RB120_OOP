class MyCar
  attr_accessor :speed, :color
  attr_reader :year, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def self.gas_mileage(miles, gallons)
    puts "Your gas mileage is #{miles / gallons} mpg."
  end

  def speed_up(increase)
    puts "You hit the gas and increase your speed by #{increase} mph."
    self.speed += increase
  end

  def brake(decrease)
    if decrease >= self.speed
      decrease = self.speed
    end
    puts "You hit the brakes and decrease your speed by #{decrease} mph."
    self.speed -= decrease
  end

  def current_speed
    puts "You are now going #{speed} mph."
  end

  def shut_off
    puts "You park the car and turn the engine off."
    self.speed = 0
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "Look at that fresh coat of #{self.color} paint! What a beaut!"
  end

  def to_s
    "Your car is a #{self.color}, #{self.year}, #{self.model}."
  end
end

ford = MyCar.new('2011', 'Green', 'Ford Escape')
ford.speed_up(20)
ford.current_speed
ford.brake(276)
ford.shut_off
ford.spray_paint('yellow')
MyCar.gas_mileage(425, 17)
puts ford