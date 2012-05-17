# The mechanics of this car are unusual. You accelerate by specifying
# a speed and a travel time at that speed. You coast by specifying a
# time for going at the speed you are already at. When you brake you
# subtract speed.


class Car
	
	def initialize(make, model, year, direction, gas_in_tank, x_axis, y_axis)
		@make = make
		@model = model
		@year = year
		@direction = direction
		@gas_in_tank = gas_in_tank
		@x_axis = x_axis
		@y_axis = y_axis
	end

	def describe
		"My car is a #{@make} #{@model} built in #{@year}. It is pointing #{@direction}. It has #{@gas_in_tank} units of gas. It is traveling at speed #{(@speed.nil? ? "0" : @speed)}."
	end

	def speed
		@speed
	end

	def moving?
		@speed>0
	end

	def make
		@make
	end

	def model
		@model
	end

	def year
		@year
	end

	def my_location
		puts "I am at #{@x_axis} on the X axis and #{@y_axis} on the Y and I am facing #{@direction}."
		end

	def tank
		@gas_in_tank
	end

	def direction
		@direction
	end

	def turn(left_or_right) # valid entries are L and R
		case @direction
		when "N"
			(left_or_right == "R" ? @direction = "E" : @direction = "W")
		when "E"
			(left_or_right == "R" ? @direction = "S" : @direction = "N")
		when "S"
			(left_or_right == "R" ? @direction = "W" : @direction = "E")
		when "W"
			(left_or_right == "R" ? @direction = "N" : @direction = "S")
		else puts "Was that turn direction you gave valid?"
		end
		# puts "After that turn my direction is now #{@direction}."

	end

	def accelerate(new_speed, time)
		if @gas_in_tank <= 0
			puts "You are outta gas baby!"
			@speed = 0
		elsif @speed.nil? || @speed == 0
			puts "Tires squeal as we start to move!"
			@speed = new_speed
			@gas_in_tank = @gas_in_tank - (@speed * time)
			move(@direction, @speed, time)
		elsif new_speed > @speed
			puts "Vroom! we are going faster!"
			@speed = new_speed
			@gas_in_tank = [@gas_in_tank - (@speed * time),0].max
			move(@direction, @speed, time)
		else
			puts "Um, you're already going faster than that."
		end
	end

	def brake(speed_reduction)	# the amount by which you are reducing speed
		if @gas_in_tank <= 0
			puts "You are outta gas baby!"
			@speed = 0
		elsif @speed.nil? || @speed == 0
			puts "You are already not moving"
			@speed = 0
		else
			@speed = [0,@speed - speed_reduction].max
			puts "Your speed is reduced by the amount you set"
		end
	end

	def drive(time) # how long you will go on at the speed you're now at
		if @gas_in_tank <= 0
			puts "You are outta gas baby!"
			@speed = 0
		elsif @speed.nil? || @speed == 0
			puts "You are already not moving"
			@speed = 0
		else
			puts "roll roll roll along"
			@gas_in_tank = [@gas_in_tank - (@speed * time),0].max
			move(@direction, @speed, time)
		end
	end

	protected

	def move(direction, movement_speed, movement_time)
		case direction
		when "N"
			@y_axis = @y_axis + (movement_speed * movement_time)
		when "E"
			@x_axis = @x_axis + (movement_speed * movement_time)
		when "S"
			@y_axis = @y_axis - (movement_speed * movement_time)
		when "W"
			@x_axis = @x_axis - (movement_speed * movement_time)
		else "Yikes! I want to move you but I don't know your direction!"
		end
	end


end

