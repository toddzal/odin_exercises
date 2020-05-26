module Towable
    def tow
        puts "Tow machine go brrrrrr."
    end
end


class Vehicle
@@vehicle_counter = 0

    def initialize (year, make, color)
        @year = year
        @make = make
        @color = color
        @speed = 0
        @@vehicle_counter += 1
    end

    def calc_MPG (miles, gallons)
        puts "The vehicles miles per gallon is #{miles/gallons}"
    end

    def count_vehicles
        puts "The number of vehicles is #{@@vehicle_counter}"
    end
    def accelerate
        @speed += 10
        puts "Your Speed is now #{@speed}"
    end
    def decelearate
        if @speed>0
        @speed -= 10
        end
        puts "Your Speed is now #{@speed}"
    end


end

class Car < Vehicle
    attr_accessor :year, :make, :color
    def initialize(year, make, color)
        super(year, make, color)
    end
end

class Truck < Vehicle
    include Towable
    attr_accessor :year, :make, :color, :dual
    def initialize(year, make, color, dual)
        super(year, make, color)
        @dual = dual
    end
end

class Student
    attr_accessor :name
    def initialize(name, grade)
        @name = name
        @grade = grade
    end
    def better_grade_than?(comp)
        @grade > comp.grade
    end

    protected

    def grade
        @grade
    end
end


ford = Car.new(2016, "Ford", "Gray" )
silverado = Truck.new(2020,"Chevy", "Black", false)
puts "The make of my car is #{ford.make}"
puts "My #{silverado.make} is #{silverado.dual ? "": " not"} a dualie"
ford.count_vehicles
silverado.tow
ford.accelerate
ford.accelerate