#!/usr/bin/env ruby
require 'set'

def find_2020(numbers)
  numbers.to_a.combination(2) do |x, y|
    
    expect = 2020 - x - y
    
    if numbers.include?(expect)
      puts x * y * expect
      break
    end
  end
end

filename = ARGV[0]

numbers = Set.new
File.readlines(filename).each do |line|
  numbers << line.to_i
end


find_2020(numbers)