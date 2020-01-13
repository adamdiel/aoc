#!/usr/bin/env ruby


def check_sequence(seq)
  repeat_flag = false
  number_array = seq.to_s.split('').map(&:to_i)

  index = 0
  
end

input = ARGV[0].split("-")

low = input[0]
high = input[1]

range = low..high

for r in range
  check_sequence(r)
end
