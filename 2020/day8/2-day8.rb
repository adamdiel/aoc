#!/usr/bin/env ruby

def run_program(instructions, acc, instruction_index, index_array)

  if index_array.include?(instruction_index)
   return [acc, false]
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
  if instruction_index == instructions.length()
    return [acc, true]
  end
  run_program(instructions, acc, instruction_index, index_array)
end

def get_accumulator(instructions)
  acc = 0
  instruction_index = 0

  instructions.each_with_index do | line, index|
    index_array = []
    local_copy = instructions.clone
    instruction_array = line.split(" ")
    instruction = instruction_array[0]
    num = instruction_array[1]
    if instruction == 'nop'
      local_copy[index] = "jmp " + num
    elsif instruction == 'jmp'
      local_copy[index] = "nop " + num
    end
    check_loop = run_program(local_copy, acc, instruction_index, index_array)
    if check_loop[1]  == true
      return check_loop[0]
    end
  end
end

filename = ARGV[0]

instructions = Array.new
File.readlines(filename).each do |line|
  instructions << line
end

puts get_accumulator(instructions)