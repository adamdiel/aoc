#!/usr/bin/env ruby


def check_sequence(seq)
  repeat_flag = false
  number_array = seq.to_s.split('').map(&:to_i)

  index = 0

  while index < number_array.length()-1
    if number_array[index] == number_array[index+1]
      repeat_flag = true
      index = index+1
    elsif number_array[index] > number_array[index+1]
      return false
    else
      index = index+1
    end
  end

  if repeat_flag == true
    counts = Hash.new(0)
    number_array.each { |num| counts[num] += 1}
    counts.each do |key, value|
      if value == 2
        return true
      end
    end
  end

  return false


end

input = ARGV[0].split("-")

low = input[0]
high = input[1]

range = low..high

count = 0
for r in range
  if check_sequence(r)
    count = count + 1
  end
end

puts count
