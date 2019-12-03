#!/usr/bin/env ruby

## Op Cods
# 99 - halt



# 1  - Opcode 1 adds together numbers read from two positions and stores the result in a third position.
# The three integers immediately after the opcode tell you these three positions - the first two indicate the
# positions from which you should read the input values, and the third indicates the position at which the output should be stored.
# For example, if your Intcode computer encounters 1,10,20,30, it should read the values
# at positions 10 and 20, add those values, and then overwrite the value at position 30 with their sum.

# 2 - Same as 1 but multiply instead of addition

# Any other - error in the system

def run_opcode(instruction, x, y, position, program_code)

  if instruction == 1
    num = program_code[x] + program_code[y]
  else
    num = program_code[x] * program_code[y]
  end

  program_code[position] = num

  program_code
end



filename = ARGV[0]

program_code = File.readlines(filename)

program_code = program_code[0].split(",")

program_code = program_code.map(&:to_i)


length = program_code.length

index = 0

(length/4).times do

  opcode = program_code[index].to_i
  opcode_x = program_code[index+1].to_i
  opcode_y = program_code[index+2].to_i
  opcode_position = program_code[index+3].to_i

  if opcode == 99
    break
  elsif opcode == 1 || opcode == 2
    program_code = run_opcode(opcode, opcode_x, opcode_y, opcode_position, program_code)
  else
    puts "BAD OPCODE"
  end

  index = index + 4
end

puts program_code.inspect
