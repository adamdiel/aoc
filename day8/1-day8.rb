#!/usr/bin/env ruby

def run_program(instructions, acc, instruction_index, index_array)

  if index_array.include?(instruction_index)
   return acc
  end

  index_array << instruction_index

  instruction_array = instructions[instruction_index].split(" ")
  instruction = instruction_array[0]
  num = instruction_array[1].to_i

  if instruction == 'nop'
    instruction_index += 1
  elsif instruction == 'acc' 
    instruction_index += 1
    acc += num
  else
    instruction_index += num
  end
  run_program(instructions, acc, instruction_index, index_array)
end

def get_accumulator(instructions)
  acc = 0
  instruction_index = 0
  index_array = []
  acc = run_program(instructions, acc, instruction_index, index_array)
end

filename = ARGV[0]

instructions = Array.new
File.readlines(filename).each do |line|
  instructions << line
end

puts get_accumulator(instructions)

