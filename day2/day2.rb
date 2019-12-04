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

def run_instruction(instruction, x, y, position, program_code)
  if instruction == 1
    num = program_code[x] + program_code[y]
  else
    num = program_code[x] * program_code[y]
  end

  program_code[position] = num

  program_code
end

def run_opcode(program_code)
  length = program_code.length

  index = 0

  (length/4).times do

    opcode = program_code[index]
    opcode_x = program_code[index+1]
    opcode_y = program_code[index+2]
    opcode_position = program_code[index+3]

    if opcode == 99
      break
    elsif opcode == 1 || opcode == 2
      program_code = run_instruction(opcode, opcode_x, opcode_y, opcode_position, program_code)
    else
      puts "BAD OPCODE"
    end

    index = index + 4
  end

  program_code
end

def run_on_temp(program_code, noun, verb)
  temp_code = program_code.clone
  temp_code[1] = noun
  temp_code[2] = verb

  run_opcode(temp_code)

  temp_code[0]
end

def run(program_code)
  noun = 0
  verb = 0
  target = 0
  while noun <= 100
    while verb <= 100
        target = run_on_temp(program_code, noun, verb)
        if target == 19690720
          return 100*noun+verb
        end
        verb = verb+1
    end
    verb = 0
    noun = noun+1
  end
  return -1
end

filename = ARGV[0]

program_code = File.readlines(filename)

program_code = program_code[0].split(",")

program_code = program_code.map(&:to_i)

final = run(program_code)

puts final
