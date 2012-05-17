require './car_class'

my_car = Car.new "Ferrari" ,"Testarossa" , 2012, "N", 40 , 0 , 0

puts my_car.describe

my_car.my_location

my_car.accelerate 3, 1

puts "Speed = " + my_car.speed.to_s
puts "Moving? " + my_car.moving?.to_s
puts "Gas remaining? " + my_car.tank.to_s
puts "Direction = " + my_car.direction
puts my_car.my_location

my_car.accelerate 4, 1

puts "Speed = " + my_car.speed.to_s
puts "Moving? " + my_car.moving?.to_s
puts "Gas remaining? " + my_car.tank.to_s
puts "Direction = " + my_car.direction
puts my_car.my_location

my_car.turn "R"

my_car.my_location

my_car.drive 2

my_car.my_location

my_car.turn "L"

my_car.my_location

my_car.accelerate 5, 2

puts "Speed = " + my_car.speed.to_s
puts "Moving? " + my_car.moving?.to_s
puts "Gas remaining? " + my_car.tank.to_s
puts "Direction = " + my_car.direction

my_car.my_location

my_car.brake(4)

my_car.drive 2

my_car.my_location