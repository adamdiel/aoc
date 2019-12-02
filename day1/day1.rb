#!/usr/bin/env ruby


def calculate_module_fuel mass
  fuel = mass/3
  fuel = fuel - 2
end

filename = ARGV[0]

totalFuel = 0

File.readlines(filename).each do |line|
  module_fuel = calculate_module_fuel(line.to_i)
  totalFuel = totalFuel + module_fuel
end

puts totalFuel
