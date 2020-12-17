#!/usr/bin/env ruby
require 'set'

def find_2020(numbers)
  numbers.each do |x|
    
    expect = 2020 - x
    
    if numbers.include?(expect)
      puts x * expect
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