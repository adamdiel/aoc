#!/usr/bin/env ruby

def calculate_fuel mass
  fuel = mass/3
  fuel = fuel-2
  puts fuel
  fuel
end

def calculate_module_fuel mass
  fuel = calculate_fuel(mass)
  if fuel <= 0
    0
  else
    fuel + calculate_module_fuel(fuel)
  end
end

filename = ARGV[0]

total_fuel = 0

File.readlines(filename).each do |line|
  module_fuel = calculate_module_fuel(line.to_i)
  total_fuel = total_fuel + module_fuel
end

puts total_fuel
